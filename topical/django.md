---
title: Django
cheatsheet: Django
topic: Django (2.0 and later)
headergfx: true
credits: true
...

<!--
twocolumns: true
-->

![model view template](./topical/images/model_view_template.pdf)\ 

# `urls.py`: Routing {-}

```python
from django.urls import path, include
from myapp import views
import accounts
urlpatterns = [
  path("/", views.welcome_page),
  path("/u/<int:uid>/",views.upage),
  include("acct/", accounts.urls),
]
```

# `views.py`: Business logic {-}


```python
from django.shortcuts import render
def welcome_page(request):
  return render(request,
                "hi.html", {})
def upage(request, uid):
  u = Users.objects.get(id=uid)
  context = {"user": u}
  return render(request, "u.html", context)
```



\columnbreak


# `models.py`: DB Schema {-}

<!--
from django.db import models
from django.core.validators import (
    MaxValueValidator,
    MinValueValidator)
-->

```python
class Author(models.Model):
  # A simple text field
  name = models.CharField(
    max_length=100)
  # Define __str__ on your models
  def __str__(self): # and return
    return self.name # its title

class Book(models.Model):
  # Use a "ForeignKey" for a
  # ManyToOne relationship
  author = models.ForeignKey(
    Author, on_delete="CASCADE")
  # Store when created and modified
  created = models.DateTimeField(
    auto_now_add=True)
  updated = models.DateTimeField(
    auto_now=True)
  # TextField is for long text.
  # null=True, blank=True allows
  # values of "" and None
  blurb = models.TextField(
    null=True, blank=True)
  # Multiple-choice fields in pattern:
  # "internal code, external label"
  CATEGORIES = [
    ("fict", "Fiction"),
    ("nonfict", "Non-fiction")]
  category = models.CharField(
    max_length=10,
    default="fict",
    choices=CATEGORIES,
  )
  # Validators add custom checks
  num_stars = models.IntegerField(
    validators=[MaxValueValidator(5),
                MinValueValidator(1)])

# ManyToMany relationships
class ReadingList(models.Model):
  books = models.ManyToManyField(Book)
```

# Forms {-}

```python
# Forms allow for input validation
class NewPersonForm(forms.Form):
  name = forms.CharField(
    required=True)
  email = forms.EmailField()
# ModelForm auto-generates forms
# from a a specified models
class BookForm(forms.ModelForm):
  class Meta:
    model = Book
    fields = ['blurb', 'category']
```

# Migration work-flow {-}

```bash
manage.py showmigrations # Check
manage.py makemigrations # Create
manage.py migrate # Apply to DB
```

\columnbreak

# ORM: CRUD Examples {-}

```python
### CREATE: Save new book to DB
book = Book.objects.create(
  title="Oliver Twist",
  num_stars=4) 
### READ: Get all fiction books
fiction_books = Book.objects\
  .filter(category="fict")
# Get all 4+ star books, newest first
new_good_books = Book.objects\
  .filter(num_stars__gt=3)\
  .order_by("-date")
### UPDATE: Change existing book(s)
book = Book.objects.get(title="1984")
book.num_stars = 5 # Updates a property
book.save() # Saves change to the DB
nonfict = Book.objects.filter(category="nonfict")
nonfict.update(num_stars=5)  # Updates all books
### DELETE: Delete one or more book(s)
book = Book.objects.get(title="1984")
book.delete() # Delete a single book
Book.objects.filter( # Delete multiple
   num_stars__lt=3).delete()
```

<!--
# ORM: QuerySets {-}


```python
Entry.objects\
    .filter(col="val")\
    .exclude(c2="v2")\
    .order_by("date")
```
-->

<!--
**models.py**

```python
class NewPersonForm(models.Model):
	name = forms.CharField(max_length=64)
	email = forms.EmailField()
```



**views.py**

```python
class NewPersonForm(forms.Form):
	name = forms.CharField(required=True)
	email = forms.EmailField()

# urls.py has: path("create/", views.person_create),
def person_create(request):
    if request.method == "GET":
        # Is initial GET: Create a blank form
        form = NewPersonForm()
    else:
        # Is POST: Create a form based on POST data
        form = NewPersonForm(request.POST)
        if form.is_valid():
            # If valid, create a new person & redirect
            person = Person()
            person.username = form.cleaned_data["name"]
            person.email = form.cleaned_data["email"]
            person.save()
            return redirect("/thanks/")
    ctx = {"form": form}
    return render(request, "create.html", ctx)
```

**templates/create.html**

```html
<h1>Create new user</h1>
<form action="." method="post">
    {% csrf_token %}
    {{ form }}
    <button>Submit</button>
</form>
```
-->






# Templates {-}

variables
:   Use "." to access `dict` keys *and* properties *and* methods

    ```html
    <h2>Hi {{ user.username }}!</h2>
    ```

if
:   \ 

    ```html
    {% if age > 17 %}
        <p>You may continue.</p>
    {% else %}
        <p>Too young.</p>
    {% endif %}
    ```

for
:   \ 

    ```html
    {% for post in blog_posts %}
        <h2>{{ post.title }}</h2>
    {% empty %}
        <em>No posts found</em>
    {% endfor %}
    ```

extends & blocks
:    Allows template variations: replace "block" placeholder in a `base.html`

    ```html
    {% extends "base.html" %}
    {% block main_content %}
        <p>User: {{ user.name }}<p>
    {% endblock main_content %}
    ```

filters
:   `<p>Hi {{ name|upper }}</p>`{.html}


include
:   `{% include "snippet.html" %}`{.javascript}


using forms
:  \ 

    ```html
    <form action="." method="POST">
      {% csrf_token %} {{ form }}
      <button>Save</button> </form>
    ```


