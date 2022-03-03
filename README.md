![th-1](https://user-images.githubusercontent.com/87088092/155640565-91ed61db-0262-4bc9-8096-51b616c21508.jpg)
# Mod3 Group Consultancy Project
#####  (this repo is used with the [Book Club app](https://github.com/Book-Club-Project/book_club_FE))

reference: [Turing documentation](https://backend.turing.edu/module3/projects/consultancy)

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#set-up">Set Up</a></li>
        <li><a href="#use-of-this-repository">Use of this Repository</a>
          <ul>
            <li>Frontend Server</li>
            <li>Backend Server</li>
          </ul>
        </li>
    </li>
    </ul>
    <li>
      <a href="#project-description">About This Project</a>
      <ul>
        <li><a href="#learning-goals-for-project">Learning Goals for Project</a></li>
        <li><a href="#versions">Versions</a></li>
        <li><a href="#important-gems">Important Gems</a></li>
        <li><a href="#database-schema">Database Schema</a></li>
      </ul>
    </li>
    <li>
      <a href="#apis">Book Club API</a>
      <details>
        <summary>Available Endpoints</summary>
        <ul>
          <li><a href="#books-endpoints">Books Endpoints</a></li>
          <li><a href="#quotes-endpoints">Quotes Endpoints</a></li>
          <li><a href="#user-endpoints">User Endpoints</a></li>
          <li><a href="#clubs-endpoints">Clubs Endpoints</a></li>
          <li><a href="#comments-endpoints">Comments Endpoints</a></li>
        </ul>
      </details>
    </li>
    <li><a href="#collaborators">Collaborators</a></li>
  </ol>
</details>

----------

## Getting Started

### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:Book-Club-Project/book_club_BE.git`
2. Navigate to the newly cloned directory `$ cd book_club_BE`
3. If bundler is not installed run `$ gem install bundler`
4. If or after bundler is installed run `$ bundle install` to install the required Gems
5. If errors occur, check for proper installation and versions of `bundler`, `ruby`, and `rails`
6. Set up the database locally with `$ rails db:{:drop,:create,:migrate,:seed}`
7. Open your text editor and check to see that `schema.rb` exists
8. You may also run the RSpec test suite locally with the command `$ bundle exec rspec` to ensure everything is functioning as expected.

### Use of this Repository
In order to run this application you need both this Backend Repository and the associated [Frontend Repository](https://github.com/Book-Club-Project/book_club_FE)

**Frontend Server**
 
For a full explanation to set-up the frontend server, please see the docs [Here](https://github.com/Book-Club-Project/book_club_FE#readme)

On you command line:
1. Navigate to the local directory where the frontend repo is housed
2. Start the Frontend server with `$ rails s` and navigate to http://localhost:5000/ in your web browser. Here you are able to interact with the application.

**Backend Server**
 
On your command line:
1. Navigate to the local directory where the backend repo is housed
2. Run `$ rails s` to run the server locally
3. Open a web browser and navigate to http://localhost:3000/
4. Here you are able to explore the endpoints exposed by the API!

----------

## Project Description

This is a back-end project designed to explore the fundamentals of exposing and consuming an API in order to develop an app that integrates microservices. Book Club builds community through literature. Users can connect through groups, messaging, and a bountiful resource of books. Functionality is achieved by combining our own database, the Google Books API, and external communication APIs to allow real-time communication, discussions, and recommendations.

## Learning Goals for Project:

Explicit
- Expose an API
- Consume an API
- Use serializers to format JSON responses
- Implement CircleCI
- Implement OAuth2

Implicit
- Project planning
- Reading/Writing documentation
- Time Management/Prioritizing Work
- Break down large project goals into manageable steps
- Implement agile workflows
- GitHub workflow and project management tools

----------

### Versions

- Ruby 2.7.2
- Rails 5.2.6

----------

### Important Gems

- Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/vajradog/faker-rails), [webmock](https://github.com/bblimke/webmock), [vcr](https://github.com/vcr/vcr)

- API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers), [figaro](https://medium.com/@MinimalGhost/the-figaro-gem-an-easier-way-to-securely-configure-rails-applications-c6f963b7e993)

- User Authentication and Security: [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)

----------

## Database Schema

![Screen Shot 2022-03-01 at 11 06 06 AM](https://user-images.githubusercontent.com/69017022/156225150-ab72f4ed-f274-4e08-b0d3-9d843f6521c4.png)

----------

## APIs
Available endpoints

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/918e865de1f64267f728?action=collection%2Fimport)

### Books endpoints

| http verb | name | data type | description | example |
| --- | --- | --- | --- | --- |
| GET | /books/:id | Integer | Returns details of a specific book based on the books id | /api/v1/books/{{book id}} |
| GET | /books/search | String | Returns a list of books with the title containing the search parameter | /api/v1/books/search?title={{search parameter}} |

Data sourced from [Google Books API](https://developers.google.com/books/docs/v1/using)

<details>
    <summary> JSON response examples </summary>

Single book by id:
```
  {
    "data": {
        "id": "ZV9DDwAAQBAJ",
        "type": "book",
        "attributes": {
            "title": "Pride",
            "authors": [
                "Ibi Zoboi"
            ],
            "genres": [
                "Young Adult Fiction / Diversity & Multicultural",
                "Young Adult Fiction / Social Themes / Class Differences",
                "Young Adult Fiction / Romance / Contemporary"
            ],
            "description": "<p>In a timely update of Jane Austen's Pride and Prejudice, National Book Award finalist Ibi Zoboi skillfully balances cultural identity, class, and gentrification against the heady magic of first love in her vibrant reimagining of this beloved classic. A smart, funny, gorgeous retelling starring all characters of color. </p><p>Zuri Benitez has pride. Brooklyn pride, family pride, and pride in her Afro-Latino roots. But pride might not be enough to save her rapidly gentrifying neighborhood from becoming unrecognizable. </p><p>When the wealthy Darcy family moves in across the street, Zuri wants nothing to do with their two teenage sons, even as her older sister, Janae, starts to fall for the charming Ainsley. She especially can’t stand the judgmental and arrogant Darius. Yet as Zuri and Darius are forced to find common ground, their initial dislike shifts into an unexpected understanding.</p><p>But with four wild sisters pulling her in different directions, cute boy Warren vying for her attention, and college applications hovering on the horizon, Zuri fights to find her place in Bushwick’s changing landscape, or lose it all.</p><p>\"Zoboi skillfully depicts the vicissitudes of teenage relationships, and Zuri’s outsize pride and poetic sensibility make her a sympathetic teenager in a contemporary story about race, gentrification, and young love.\" (Publishers Weekly, \"An Anti-Racist Children's and YA Reading List\")</p>",
            "rating": 4
        }
    }
}

```
Books by search example used ("Pride"):
```
{
    "data": [
        {
            "id": "ZV9DDwAAQBAJ",
            "type": "book",
            "attributes": {
                "title": "Pride",
                "authors": [
                    "Ibi Zoboi"
                ],
                "genres": [
                    "Young Adult Fiction"
                ],
                "description": "Pride and Prejudice gets remixed in this smart, funny, gorgeous retelling of the classic, starring all characters of color, from Ibi Zoboi, National Book Award finalist and author of American Street. Zuri Benitez has pride. Brooklyn pride, family pride, and pride in her Afro-Latino roots. But pride might not be enough to save her rapidly gentrifying neighborhood from becoming unrecognizable. When the wealthy Darcy family moves in across the street, Zuri wants nothing to do with their two teenage sons, even as her older sister, Janae, starts to fall for the charming Ainsley. She especially can’t stand the judgmental and arrogant Darius. Yet as Zuri and Darius are forced to find common ground, their initial dislike shifts into an unexpected understanding. But with four wild sisters pulling her in different directions, cute boy Warren vying for her attention, and college applications hovering on the horizon, Zuri fights to find her place in Bushwick’s changing landscape, or lose it all. In a timely update of Jane Austen's Pride and Prejudice, critically acclaimed author Ibi Zoboi skillfully balances cultural identity, class, and gentrification against the heady magic of first love in her vibrant reimagining of this beloved classic.",
                "rating": 4
            }
        },
        {
            "id": "1JMsEAAAQBAJ",
            "type": "book",
            "attributes": {
                "title": "The Pride Omnibus",
                "authors": [
                    "Joe Glass"
                ],
                "genres": [
                    "Comics & Graphic Novels"
                ],
                "description": "Joe Glass's The Pride in a full omnibus trade paperback, collecting volumes 1 and 2 as well as the collection of self-contained stories, The Pride Adventures! In The Pride, FabMan is sick of being seen as a joke. Tired of the LGBTQ+ community being seen as inferior to straight heroes, he thinks it's about damn time he did something about it. Bringing together some of the world's greatest LGBTQ+ superheroes, the Pride is born to protect the world and fight prejudice, misrepresentation and injustice--not to mention a pesky supervillain or two. The Pride Adventures brings a whole host of extra, self-contained stories and adventures starring the heroes of the Pride! See the team members face down crazed shooters, invasions, and even a sixty-foot-tall drag queen! Featuring a slew of incredible artistic talent, plus stories from writers Mike Garley, Sina Grace and PJ Montgomery too! Follow the LGBTQ+ heroes into whole new stories and meet even more characters in the world of The Pride! Join the Pride as they work to change the world and show just what they can do! Collects the original digital series The Pride and The Pride Adventures in print for the first time. \"[F]or readers hungry for queer superheroes. Joe Glass' The Pride introduces a superhero universe built on LGBTQ+ inclusion, following a team that is explicitly created to show the range of the queer experience. The Pride features superheroes who are gay, lesbian, bi, trans, non-binary, and children of gay parents. Glass blends modern queer issues with classic superhero storytelling to tell narratives that classic superhero comics haven't touched. . . . The Pride excels at using queer struggle and joy to show a different side of the superhero genre.\"--AV Club \"I highly recommend this smart, charming, wonderful book to anyone who likes good comics. It's absolutely a pleasure to read and a clear labor of love.\"--Gail Simone, Batgirl, Leaving Megalopolis, Clean Room \"Old-school and progressive at the same time. Classic, high-energy superhero action that gives the queer community the heroes they've always deserved.\"--Steve Orlando, Midnighter, Virgil \"The Pride is the modern, inclusive, and compelling superhero epic the world needs today.\"--Alex Segura, co-writer of The Black Ghost and author of the acclaimed Pete Fernandez Miami Mystery novel series.",
                "rating": 3
            }
        },
}
```

</details>


### Quotes endpoints

| http verb | name | data type | description | example |
| --- | --- | --- | --- | --- |
| GET | /quote | String | Returns a random literature quote | /api/v1/quote |

Data sourced from [Quote API](https://www.quotes.net/quotes_api.php)

<details>
  <summary> JSON response examples </summary>

Random quote:
```
{
    "data": {
        "id": null,
        "type": "quote",
        "attributes": {
            "quote": "You are who you are, and no one can change that. So be yourself, because no one can do it better.",
            "author": "Meylin D. Bojorge"
        }
    }
}

```

</details>


### User endpoints

| http verb | name | data type | description | example |
| --- | --- | --- | --- | --- |
| GET | /users | String | Returns all users | /api/v1/users |
| GET | /users/:id | Integer | Returns a single user based on id | /api/v1/users/{{users id}} |
| GET | /users/:id/clubs | String | Returns all clubs that a specific user belongs to | /api/v1/users/{{user_id}}/clubs |
| PATCH/PUT | /users/:id | | Edits a single user based on id | /api/v1/comments/{{user_id}} |
| DELETE | /users/:id | | Deletes a single user based on id | /api/v1/comments/{{user_id}} |

<details>
  <summary> JSON response examples </summary>

All users:
```
{
    "data": [
        {
            "id": "1",
            "type": "user",
            "attributes": {
                "username": "1",
                "email": "1@mail.com"
            }
        },
        {
            "id": "2",
            "type": "user",
            "attributes": {
                "username": "2",
                "email": "2@mail.com"
            }
        },
        {
            "id": "3",
            "type": "user",
            "attributes": {
                "username": "3",
                "email": "3@mail.com"
            }
        },
        {
            "id": "4",
            "type": "user",
            "attributes": {
                "username": "4",
                "email": "4@mail.com"
            }
        }
    ]
}
```
Single user by id
```
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "username": "1",
            "email": "1@mail.com"
        }
    }
}
```
All of a specific user's association with clubs:
```
{
    "data": [
        {
            "id": "1",
            "type": "club",
            "attributes": {
                "name": "Cool Cats",
                "host_id": 1,
                "book_id": 3
            }
        }
    ]
}
```
</details>


### Clubs endpoints

| http verb | name | data type | description | example |
| --- | --- | --- | --- | --- |
| GET | /clubs | String | Returns all clubs | /api/v1/clubs |
| GET | /clubs/:id | Integer | Returns a single club based on id | /api/v1/clubs/{{club_id}} |
| GET | /clubs/:id/users | String | Returns all users belonging to a specific club | /api/v1/clubs/{{club_id}}/users |
| GET | /clubs/:id/comments | String | Returns all comments belonging to a specific club | /api/v1/clubs/{{club_id}}/comments |
| PATCH/PUT | /clubs/:id| | Edits a specific club's data | /api/v1/clubs/{{club_id}} |
| DELETE | /clubs/:id| | Deletes a specific club's data | /api/v1/clubs/{{club_id}} |


<details>
  <summary> JSON response examples </summary>

All clubs:
```
{
    "data": [
        {
            "id": "1",
            "type": "club",
            "attributes": {
                "name": "Cool Cats",
                "host_id": 1,
                "book_id": 3
            }
        },
        {
            "id": "2",
            "type": "club",
            "attributes": {
                "name": "Turing Nerds",
                "host_id": 2,
                "book_id": 6
            }
        },
        {
            "id": "3",
            "type": "club",
            "attributes": {
                "name": "Sherlock Homies",
                "host_id": 3,
                "book_id": 7
            }
        }
    ]
}
```
Single club by id:
```
{
    "data": {
        "id": "1",
        "type": "club",
        "attributes": {
            "name": "Cool Cats",
            "host_id": 1,
            "book_id": 3
        }
    }
}
```
A specific club's users:
```
{
    "data": [
        {
            "id": "1",
            "type": "user",
            "attributes": {
                "username": "1",
                "email": "1@mail.com"
            }
        },
        {
            "id": "2",
            "type": "user",
            "attributes": {
                "username": "2",
                "email": "2@mail.com"
            }
        },
        {
            "id": "3",
            "type": "user",
            "attributes": {
                "username": "3",
                "email": "3@mail.com"
            }
        },
        {
            "id": "4",
            "type": "user",
            "attributes": {
                "username": "4",
                "email": "4@mail.com"
            }
        }
    ]
}
```
A specific club's comments:
```
{
    "data": [
        {
            "id": "1",
            "type": "comment",
            "attributes": {
                "title": "Hello",
                "body": "Blah",
                "user_id": 1,
                "club_id": 1
            }
        },
        {
            "id": "2",
            "type": "comment",
            "attributes": {
                "title": "Comments",
                "body": "Blah Blah",
                "user_id": 2,
                "club_id": 1
            }
        },
        {
            "id": "3",
            "type": "comment",
            "attributes": {
                "title": "Coolio",
                "body": "Blah Blah Blah",
                "user_id": 3,
                "club_id": 1
            }
        },
        {
            "id": "4",
            "type": "comment",
            "attributes": {
                "title": "Goodbye",
                "body": "Blah Blah Blah Blah",
                "user_id": 4,
                "club_id": 1
            }
        }
    ]
}
```
</details>


### Comments endpoints

| http verb | name | data type | description | example |
| --- | --- | --- | --- | --- |
| GET | /comments | String | Returns all comments | /api/v1/comments |
| POST | /comments | String | Creates a new comment |  /api/v1/comments |
| PATCH/PUT | /comments/:id | | Returns a single comment based on id | /api/v1/comments/{{comment_id}} |
| DELETE | /comments/:id |  | Deletes a comment | /api/v1/comments/{{comment_id}} |


<details>
  <summary> JSON response examples </summary>

All comments:
```
{
    "data": [
        {
            "id": "1",
            "type": "comment",
            "attributes": {
                "title": "Hello",
                "body": "Blah",
                "user_id": 1,
                "club_id": 1
            }
        },
        {
            "id": "2",
            "type": "comment",
            "attributes": {
                "title": "Comments",
                "body": "Blah Blah",
                "user_id": 2,
                "club_id": 1
            }
        },
        {
            "id": "3",
            "type": "comment",
            "attributes": {
                "title": "Coolio",
                "body": "Blah Blah Blah",
                "user_id": 3,
                "club_id": 1
            }
        },
        {
            "id": "4",
            "type": "comment",
            "attributes": {
                "title": "Goodbye",
                "body": "Blah Blah Blah Blah",
                "user_id": 4,
                "club_id": 1
            }
        },
        {
            "id": "5",
            "type": "comment",
            "attributes": {
                "title": "Goodbye",
                "body": "Blah Blah Blah Blah",
                "user_id": 4,
                "club_id": 2
            }
        },
        {
            "id": "6",
            "type": "comment",
            "attributes": {
                "title": "Goodbye",
                "body": "Blah Blah Blah Blah",
                "user_id": 4,
                "club_id": 3
            }
        }
    ]
}
```
</details>


----------

## Collaborators

([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <!-- Arnaldo -->
    <td align="center"><a href="https://github.com/arnaldoaparicio"><img src="https://avatars.githubusercontent.com/u/88012780?v=4" width="100px;" alt=""/><br /><sub><b>Arnaldo (he/him)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=arnaldoaparicio" title="Code">💻</a> <a href="#ideas-arnaldoaparicio" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=arnaldoaparicio" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_BE/pulls?q=is%3Apr+reviewed-by%3Ajarnaldoaparicio" title="Reviewed Pull Requests">👀</a></td>
    <!-- Eric -->
    <td align="center"><a href="https://github.com/echon006"><img src="https://avatars.githubusercontent.com/u/89038271?v=4" width="100px;" alt=""/><br /><sub><b>Eric (he/him)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=echon006" title="Code">💻</a> <a href="#ideas-echon006" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=echon006" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_BE/pulls?q=is%3Apr+reviewed-by%3Ajechon006" title="Reviewed Pull Requests">👀</a></td>
    <!-- Mallory -->
    <td align="center"><a href="https://github.com/Malllll12"><img src="https://user-images.githubusercontent.com/87088092/155652176-cb2263b4-550c-4a80-b38c-519308bd166f.png" width="100px;" alt=""/><br /><sub><b>Mallory (she/her)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=Malllll12" title="Code">💻</a> <a href="#ideas-Malllll12" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=Malllll12" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_BE/pulls?q=is%3Apr+reviewed-by%3AMalllll12" title="Reviewed Pull Requests">👀</a></td>
    <!-- Sierra -->
     <td align="center"><a href="https://github.com/Sierra-T-9598"><img src="https://user-images.githubusercontent.com/87088092/155652453-38a801c4-1243-46ce-a42f-b8416cff0423.png" width="100px;" alt=""/><br /><sub><b>Sierra (she/her)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=Sierra-T-9598" title="Code">💻</a> <a href="#ideas-Sierra-T-9598" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=Sierra-T-9598" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_BE/pulls?q=is%3Apr+reviewed-by%3ASierra-T-9598" title="Reviewed Pull Requests">👀</a></td>
    <!-- Brad -->
     <td align="center"><a href="https://github.com/jbreit88"><img src="https://avatars.githubusercontent.com/u/88853324?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Brad (he/him)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=jbreit88" title="Code">💻</a> <a href="#ideas-jbreit88" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=jbreit88" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_BE/pulls?q=is%3Apr+reviewed-by%3Ajbreit88" title="Reviewed Pull Requests">👀</a></td>
    <!-- Devin -->
    <td align="center"><a href="https://github.com/devin-p-lay"><img src="https://avatars.githubusercontent.com/u/87088092?v=4" width="100px;" alt=""/><br /><sub><b>Devin (he/him)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=devin-p-lay" title="Code">💻</a> <a href="#ideas-devin-p-lay" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_BE/commits?author=devin-p-lay" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_BE/pulls?q=is%3Apr+reviewed-by%3Ajdevin-p-lay" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
