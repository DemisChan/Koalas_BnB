# {{PROBLEM}} Web Design Recipe (Level Three)

## 1. Describe the Problem

_Put or write the user stories here. Add any clarifying notes you might have._

## 2. Design the Interface

_This is the fun part! Use excalidraw.com or a similar tool to design some
wireframes (rough sketches of the user interface). Include interactions and
transitions between pages — those are the most critical part._

![Diary design example](./diary_design.png)

## 3. Design the Database

_Design the data tables that will store all of the information your application
manages. Include the data types and examples of three rows. Consider use Google
Sheets or [AsciiTable](https://ozh.github.io/ascii-tables/) to do this._

```plain
# Example

Table name: diary_entries

| id (NUMBER) |  title (TEXT)   |     contents (TEXT)      |
|-------------|-----------------|--------------------------|
|           1 | What a nice day | Today was a great day... |
|           2 | What a bad day  | Today was an awful da... |
|           3 | What a cool day | Today was a cool day ... |
```




```ruby
# INDEX
# Request: GET /properties


# CREATE
# POST /properties
# With data: { Name: , Address: , Description: , Price:, Availability}


# READ
# GET /properties/:index


# UPDATE
# PATCH /properties/:index
# With data: { Name: , Address: , Description: , Price:, Availability}


# DELETE
# DELETE /properties/:index


```

> Remember:

> GET: Getting a single item or a list of items

> POST: Adding an item

> PATCH: Updating an item

> DELETE: Deleting an item


## 4. Create Examples of User Interactions

_Create examples of user interactions and expectations._

```ruby
# As you learn the testing tools you might start writing with realistic test
# code here, but at the start it's OK if it's just English or made up code.

# View no entries
visit "/properties"
# User sees:Empty page with add property link.

# Add an entry
visit "/properties"
click link "Add property"
enter "Villa Rainbow" into "Name" field
enter "Paphos, Cyprus" into "Address" field
enter "Beautiful house on the beach" into "Description" field
enter "£80" into "Price" field
enter "Yes/No" into "Availability" field


click button "Post"
# User sees in the property list:
# Name: Villa Rainbow
# Address: Paphos, Cyprus
# Desciption: Beautiful house on the beach
# Price: £80
# Availability: Yes/No


# Multiple entries
visit "/properties"
click link "Add property"
enter "Villa Rainbow" into "Name" field
enter "Paphos, Cyprus" into "Address" field
enter "Beautiful house on the beach" into "Description" field
enter "£80" into "Price" field
enter "Yes/No" into "Availability" field
click button "Post"
click link "Add property"
enter "Villa Rainbow 2" into "Name" field
enter "Limassol, Cyprus" into "Address" field
enter "Beautiful house in the woods" into "Description" field
enter "£90" into "Price" field
enter "Yes/No" into "Availability" field
click button "Post"
# User sees in the property list:
# Name: Villa Rainbow
# Address: Paphos, Cyprus
# Desciption: Beautiful house on the beach
# Price: £80
# Availability: Yes/No
# User sees in the house list:
# Name: Villa Rainbow 2
# Address: Limassol, Cyprus
# Desciption: Beautiful house in the woods
# Price: £90
# Availability: Yes/No
```

## 6. Test-Drive the Behaviour

_Follow this cycle:_

1. Add a feature test in `/spec/feature/` (RED)
2. Implement the behaviour in `app.rb`
3. Does it pass without data model changes? (GREEN) Then skip to step 6.
4. Otherwise, add a unit test for the data model to `/spec/unit` (RED)
5. Implement the behaviour in your data model class. (GREEN)
6. Apply any refactors to improve the structure of the code. (REFACTOR)  
   Run `rubocop` as part of this.
7. Go back to step 1.


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-three&prefill_File=recipe/recipe.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-three&prefill_File=recipe/recipe.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-three&prefill_File=recipe/recipe.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-three&prefill_File=recipe/recipe.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-three&prefill_File=recipe/recipe.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
