# {{PROBLEM}} Web Design Recipe (Level Three)

## 1. Describe the Problem

_Put or write the user stories here. Add any clarifying notes you might have._
As a user I want to be able to post an advert of a house so others can contact me to rent it. 



## 2. Design the Interface

_This is the fun part! Use excalidraw.com or a similar tool to design some
wireframes (rough sketches of the user interface). Include interactions and
transitions between pages — those are the most critical part._

![Diary design example](./Design.png)



## 3. Design the Database

_Design the data tables that will store all of the information your application
manages. Include the data types and examples of three rows. Consider use Google
Sheets or [AsciiTable](https://ozh.github.io/ascii-tables/) to do this._



```plain
# Example

Table name: houses

+=====+====================+=================+============================================+=======================+===============+
| ID  |        Name        |     Address     |                Description                 |  Price per night ($)  |  availability |
+=====+====================+=================+============================================+=======================+===============+
|  1  |  Brown house       |  34 Skin lane   |  A lovely two bes house with lots of room  |                   34  |  Yes          |
+-----+--------------------+-----------------+--------------------------------------------+-----------------------+---------------+
|  2  |  Country Barn      |  604 Ash Drive  |  A spooky barn                             |                   55  |  No           |
+-----+--------------------+-----------------+--------------------------------------------+-----------------------+---------------+
|  3  |  London Penthouse  |  596 Lit yard   |  Somewhere you can have a party            |                  105  |  Yes          |
+-----+--------------------+-----------------+--------------------------------------------+-----------------------+---------------+



```

## 4. Create Examples of User Interactions

_Create examples of user interactions and expectations._

```ruby
# As you learn the testing tools you might start writing with realistic test
# code here, but at the start it's OK if it's just English or made up code.

# View no entries
visit "/houses"
# User sees: You have no diary entries.

# Add an entry
visit "/diary"
click link "Add Entry"
enter "A beautiful day" into "Title" field
enter "I had a very nice day it's true." into "Contents" field
click button "Post"
# User sees in the diary list:
# A beautiful day
# I had a very nice day it's true.

# Multiple entries
visit "/diary"
click link "Add Entry"
enter "A beautiful day" into "Title" field
enter "I had a very nice day it's true." into "Contents" field
click button "Post"
click link "Add Entry"
enter "A bad day" into "Title" field
enter "I had a very bad day." into "Contents" field
click button "Post"
# User sees in the diary list:
# A bad day
# I had a very bad day.
# A beautiful day
# I had a very nice day it's true.
```

## 5. Class structure

```ruby

Class PropertyList
   def initialize(database)
   end

   def list
      #returns all properties in database
   end

   def add(property) #property is an entity of Property class
      #adds a new property to PropertyList
   end

   def remove(index) #index is an integer
      #deletes property at specified index
   end

   def update(index, name, location, address, price, description)
      #updates whichever field is required
   end

   def get(index) #index is an integer
      #returns the property at the specified index
   end
   
   private

   def row_to_object(row)
      #returns the full advert
   end
end

Class Property
   def initialize(name, location, address, price, description,  id = 0)
   end

   def name
      #returns name
   end
   
   def location
      #returns location
   end

   def address
      #returns address
   end

   def price
      #returns price
   end

   def description
      #returns description
   end

   def id
      #returns id
   end
end

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
