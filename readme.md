# Request / Response MVC!

## Request and Response MVC part dos!

Start it up by running 'ruby bin/server.rb'

As is, 10 test items will be generated and added to the ToDo list.


You can use /tasks to view the list of currently completed / to
complete items on the list.

You can view a single item at /tasks/(Task ID)

You can modify an existing item with a PUT action to /tasks/(Task ID) with field "body" for main text, and "completed" to modify completion status.

You can send a DELETE action to /tasks/(Task ID) to remove that item, it's ID will not become available.

You can create a new ToDo item with a POST action to /tasks, all it needs is a "body" field, as the ID will be generated and items added to a list default as incomplete.

Items are viewed in HTML by default, you may add a .json extension for data to return in that manner.

Currently on the html list you may click the X mark next to an item to complete it, at present you will be redirected to the Json information read for the item, and will need to return to the list manually.

CSS fille is not loading properly, tell me why, I'm sure I have derped.
