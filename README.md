
# Members Only project
This project consists of using the bcrypt gem to have a first approach at authentication in rails. We will build an application that allows users to create posts and the authors of the posts are displayed only if the user is logged in.
Also it was built using [Oding project guide](https://www.theodinproject.com/courses/ruby-on-rails/lessons/authentication) that is about authentication as part of forms and authentication section in ruby on rails technical curriculum of [Microverse](microverse.org)


# Concepts used here
* cookies
  * remember token
* sessions
  * Log in and log out
* hashed password used as password digest
* ActiveRecord
  * CRUD operations
  * Forms
  
# What do we need to run the project
* Ruby 2.2+
* Rails 6
* Node.js 8.16.0+
* Yarn 1.x+

# After install the requirements run the following commands:
<p>
 1 - <code> Bundle update </code>
</p>
<p>
 2 - <code> Bundle install </code>
</p>
<p>
 3 - <code> yarn install --check-files </code>
</p>
<p>
 4 - <code> bundle exec rails webpacker:install </code> note: overwrite all
</p>
<p>
 5 - <code> rails db:migrate </code>
</p>
<p>
 6 - <code> rails db:seed </code>
</p>
<p>
 7 - <code> rails server </code>
</p>

## login if database seeded
<p> <strong> email: </strong> gabriela@example.com </p>
<p> <strong> password: </strong> foobar </p>


## Collaborators

[Ivan Derlich](https://github.com/IvanDerlich/) <br>
[Gabriela Cruz](https://github.com/ViriCruz/)
