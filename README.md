# Task Details

Codecademy Engineering Machine Coding
Build a RESTful API to upload and manage cat pictures.
Requirements
Your API must support:
Uploading a cat pic. - Done
Deleting a cat pic. - Done
Updating an uploaded cat pic in place. - Done
Fetching a cat image by its ID. - Done
Fetching a list of uploaded cat pics. - Done

Additional Requirements
You must:
Use accurate HTTP response codes and handle errors. - Done

Provide API documentation. - Done
Write basic tests for your code. - Done

Suggestions
To impress, consider:
Dockerizing your application, it's okay if your pictures do not persist outside of the container runtime
Others:
This round will be immediately followed by a live discussion on the project with a Codecademy engineer.

Share the repo through Github with the engineer for review post the discussion mandatorily.
Add some basic documentation steps to test the endpoints in the README - Done

Feel free to use any tools or IDEs of your choice and implement it using any tech stack and/or libraries – be open about your choices and implementation decisions and usage of tools
Feel free to take decisions on anything that you might have questions or are uncertain about – remember you get a chance to discuss and if required defend your choices in the review

-------------------------------
# Dependencies
Ruby version >= 3.2.2
PostgreSQL

# Installation Steps:
```
git clone
cd cats_pic
bundle install
rails active_storage:install
rails db:migrate
rails generate rspec:install
rails db:create RAILS_ENV=test
```


# Starting the rails server:
```
rails s
```

# Running Testcases:
```
bundle exec rspec
```

# API Docs file:
doc/schema.json
the schema file can be used as an input of Swagger UI (https://github.com/swagger-api/swagger-ui)

# Updating OpenAPI Schema file:
```
OPENAPI=1 bundle exec rspec
```

# Update the api annotation on controllers:
```
bundle exec chusaku
```

# Steps to test endpoints locally:

1. Get all cats pics
```
curl --location 'http://localhost:3000/api/v1/cats_pic'
```

2. Get a specific cat pic stored with id 1
```
curl --location 'http://localhost:3000/api/v1/cats_pic/1'
```

3. Create a Cat pic
```
curl --location 'http://localhost:3000/api/v1/cats_pic' \
--form 'title="pic 1"' \
--form 'description="description"' \
--form 'image=<!-- Attach Image -->'
```

4. Updates a cat pic stored with id 1
```
curl --location --request PUT 'http://localhost:3000/api/v1/cats_pic/1' \
--form 'title="pic 2"' \
--form 'description="description 2"' \
--form 'image=<!-- Attach Image -->'
```

5. Delete a stored cat pic with id 2
```
curl --location --request DELETE 'http://localhost:3000/api/v1/cats_pic/2'
```


