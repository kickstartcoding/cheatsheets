---
title: Router, Redux, MERN
cheatsheet: 5
...


# React Router {-}

`<Route>`{.html}

:    Functions like an *if-statement*, conditionally renders the given
component based on the URL path

`<Link>`{.html}

:    Functions like an *a tag* link, "tricks" user that they are going to a
new page, but doesn't truly cause a page refresh

`<Switch>`{.html}

:    Let only 1 route get matched


`<BrowserHistory>`{.html}

:    Uses the Browser history (back and forward buttons) to simulate going
from one page to another



# Examples {-}

Router and Redux need `src/index.js` modifications (imports omitted).

```javascript
let store = createStore(reducer);
ReactDOM.render(
```
```html
    <Provider store={store}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </Provider>,
```
```javascript
  document.getElementById("root"));
```

Put top-level routes in `App.js`:

```html
<Switch>
  <Route path="/about/"
    component={About} />
  <Route path="/post/:id/"
    component={BlogPost} />
</Switch>
```

Link examples:

```html
<Link to="/about/">About</Link>
<Link to={"/post/"+postId+"/"}>
  Read More...</Link>
```

# MERN Stack {-}

MongoDB

:    NoSQL database that stores JSON *documents*, with no built-in
schema-enforcement

Express.js

:    Most popular backend web framework for Node.js

React + Redux

:    State-management library, popular with large React projects where
state gets too huge for the App component

\columnbreak

# React Redux {-}

![React Redux](./kickstart-frontend/images/small.png)\ 


Store

:    The Redux "ORM", used most for data fetched from back-end


Action

:    Represents an "event" that occurs, e.g. an action is *dispatched* when
data is `fetch`ed from the back-end, and another when the response comes
back


Reducer

:    Triggered when an action is dispatched, a reducer modifies (a
duplicate of) the state based on the action that happened

<!--
Store state slice

:    Redux store is partitioned into slices that handle different aspects of
large applications (analogy: *Django apps*)
-->


# React Redux Code {-}


**Action Creators** (found in `actions/`)
```javascript
const doIncrement = () => {
  return { type: INCREMENT }; }
const addTodo = (item) => {
  return { type: ADD, text: item }; }
```

**Dispatching** (found in `components/`)
```javascript
let action =
  addTodo(this.state.text);
this.props.dispatch(action);
```


**Reducers** (found in `reducers/`)
```javascript
const initialState = {
  count: 0,
  todoList: [],
};
const todo = (state, action) => {
switch (action.type) {
  case ADD:
  return Object.assign({},state,{
    count: state.count + 1,
  });
  case INCREMENT:
  return Object.assign({},state,{
    todoList: todoList.concat([
    text: action.text ]),
  });
  /* ... */
```


\columnbreak


# MongoDB {-}

noSQL database

:    A database that doesn't use SQL and traditional table / row / column organization

document

:    *row* in SQL, single item of data in NoSQL, represented by BSON (a JSON variant)

collection

:    *table* in SQL, group of documents with a name


ObjectID

:    Long random string serving as unique ID for each document


# MongoDB CRUD {-}

```javascript
db.userprofiles.find(
  {name: "janeqhacker"})
db.userprofiles.insertOne({
  name: "janeqhacker",
  mood: "happy",
  posts: [] })
db.userprofiles.update(
  { name: "janeqhacker" }, {
    $push: { posts: "Good idea" },
    $set: { mood: "thoughtful" } })
db.userprofiles.deleteOne(
  {name: "janeqhacker"})
```


# Express.js + Mongo {-}



```javascript
const express = require('express');
const app = express();
app.get("/", (req, res) => {
  res.send("Hello World!");
});
app.get("/find", (req, res) => {
  db.collection("userprofiles")
    .find({name: "janeqhacker"},
    (err, data) => {
      if (err) throw err;
      res.json(data);
    });
});
app.post("/create", (req, res) => {
  const data = {name: "janeqhacker"};
  db.collection("userprofiles")
    .insertOne(data,(err,data)=>{
    /* ...snip... */ });
});
app.listen(3000, () => {
  console.log("ready @ :3000");})
```



