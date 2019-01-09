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

# Routing {-}

```python
from django.urls import path, include
from myapp import views
from accounts import views as a_views

urlpatterns = [
    path("/", views.welcome_page),
    path("/u/<int:uid>/", views.upage),
    include("accounts/", a_views),
]
```

\columnbreak

# ORM: QuerySets {-}


```python
Entry.objects\
    .filter(col="val")\
    .exclude(c2="v2")\
    .order_by("date")
```

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


\columnbreak




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


