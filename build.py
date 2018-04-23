#!/usr/bin/env python3

from glob import glob

import os
import sys
import subprocess

COHORT = '2018-Spring'

PATH = os.path.dirname(os.path.abspath(__file__))

_out_paths = [] # hack to keep track of all outputed files

filter_by = None

def _files(dirname, extension, out_dirname=None):
    '''
    Generator to create input paths and output paths for markdown from a given
    directory, creating parent directories as needed
    '''

    if out_dirname is None:
        out_dirname = dirname

    # Create output dir if needed
    out_path_base = os.path.join(PATH, 'build', out_dirname)
    if not os.path.exists(out_path_base):
        os.makedirs(out_path_base)

    # Loop through all markdown files in source directory yielding parallel
    # filenames in output directory
    for path_suffix in glob(os.path.join(PATH, dirname, '*.md')):
        full_path = os.path.join(PATH, path_suffix)
        filename, _ = os.path.splitext(os.path.basename(full_path))
        out_path = os.path.join(out_path_base, filename + extension)

        if filter_by and filter_by not in path_suffix:
            continue

        print('%s: %s -> %s' % (dirname.capitalize(), path_suffix, out_path))
        _out_paths.append(out_path)
        yield full_path, out_path


def _which_pandoc():
    if os.path.exists('/root/.cabal/bin/pandoc'):
        return '/root/.cabal/bin/pandoc' # For docker config
    return 'pandoc'

def _pandoc(*args):
    pandoc_bin = _which_pandoc()
    cmd = [pandoc_bin, '-f', 'markdown'] + list(args)
    print(' '.join(cmd))
    return subprocess.check_call(cmd)

def build_lessons():
    for full_path, out_path in _files('lessons', '.html'):
        _pandoc(
            '--toc',
            full_path,
            '-t', 'html',
            '--css', './src/css/pandoc.css',
            '--self-contained',
            '-o', out_path,
            '-s',
        )

def build_syllabus(extension):

    # Loop through and build the syllabus
    for full_path, out_path in _files('syllabus', extension):
        if extension == '.pdf':
            _pandoc(
                full_path,
                '--variable=cohort:%s' % COHORT,
                '-t', 'latex',
                '--template', './src/templates/custom.latex',
                '--latex-engine', 'pdflatex',
                '-o', out_path,
            )
        else:
            _pandoc(
                full_path,
                '--variable=cohort:%s' % COHORT,
                '-o', out_path,
                '-s',
            )

def build_quizes(extension):

    # Loop through and build the quizes
    for full_path, out_path in _files('quizes', extension):
        if extension == '.pdf':
            _pandoc(
                full_path,
                '--variable=cohort:%s' % COHORT,
                '-t', 'latex',
                '--template', './src/templates/custom.latex',
                '--latex-engine', 'pdflatex',
                '-o', out_path,
            )
        else:
            _pandoc(
                full_path,
                '--variable=cohort:%s' % COHORT,
                '-o', out_path,
                '-s',
            )

    # Loop through and build the answer key
    for full_path, out_path in _files('quizes', extension, out_dirname='quiz-keys'):
        if extension == '.pdf':
            _pandoc(
                full_path,
                '--variable=showanswers:true',
                '-t', 'latex',
                '--template', './src/templates/custom.latex',
                '--latex-engine', 'pdflatex',
                '-o', out_path,
            )
        else:
            _pandoc(
                full_path,
                '--variable=showanswers:true',
                '-o', out_path,
                '-s',
            )


def build_cheatsheets(extension):
    for full_path, out_path in _files('cheatsheets', extension):
        if extension == '.pdf':
            _pandoc(
                full_path,
                '--variable=cohort:%s' % COHORT,
                '-t', 'latex',
                '--template', './src/templates/custom.latex',
                '--latex-engine', 'pdflatex',
                '--toc-depth', '1',
                '-o', out_path,
            )
        else:
            _pandoc(
                full_path,
                '--variable=cohort:%s' % COHORT,
                '--toc',
                '-o', out_path,
                '-s',
            )

def build_table_of_contents():
    out_path_base = os.path.join(PATH, 'build')
    with open(os.path.join(PATH, 'templates', 'html', 'toc.html')) as fd:
        text = fd.read()
    links = '\n'.join(
        '<li><a href="%(url)s">%(name)s</a></li>' % {
            "name": os.path.basename(path),
            "url": './%s' % path[len(out_path_base):],
        }
        for path in _out_paths
    )
    result = text.replace('{{links}}', links)
    with open(os.path.join(PATH, 'build', 'index.html'), 'w+') as fd:
        fd.write(result)


def main():
    global filter_by
    if sys.argv[-1] == '_cs': # hack to focus on one as i wokr on styles
        build_cheatsheets('.pdf')
        return

    if sys.argv[-2] == '--filter':
        filter_by = sys.argv[-1]

    elif sys.argv[-1] not in ('print', 'web'):
        print("USAGE: Specify either `print' or `web', like:")
        print(' '.join(list(sys.argv) + ['web']))
        sys.exit(1)

    build_lessons()
    build_quizes('.html')
    build_cheatsheets('.html')
    build_syllabus('.html')
    if sys.argv[1] in ('print', '--filter'):
        build_quizes('.pdf')
        build_cheatsheets('.pdf')
        build_syllabus('.pdf')

    # have to build TOC last because of hacky side-effects of building the
    # other stuff
    #if sys.argv[-1] in ('print', 'web'):
    #    build_table_of_contents()

if __name__ == '__main__':
    build_cheatsheets('.pdf')

