![th-1](https://user-images.githubusercontent.com/87088092/155640565-91ed61db-0262-4bc9-8096-51b616c21508.jpg)
# Mod3 Group Consultancy Project
#####  (this repo is used with the [Book Club app](https://github.com/Book-Club-Project/book_club_FE))

reference: [Turing documentation](https://backend.turing.edu/module3/projects/consultancy)

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li>
      <a href="#project-description">About This Project</a>
      <ul>
        <li><a href="#learning-goals-for-project">Learning Goals for Project</a></li>
      </ul>
      <ul>
        <li><a href="#versions">Versions</a></li>
      </ul>
      <ul>
        <li><a href="#important-gems">Important Gems</a></li>
      </ul>
      <ul>
        <li><a href="#database-schema">Database Schema</a></li>
      </ul>
    </li>
    <li>
      <a href="#book-club-api">Book Club API</a>
    </li>
    <li><a href="#collaborators">Collaborators</a></li>
  </ol>
</details>

----------

## Getting Started

----------

## Project Description

This is a back-end project designed to exercise the fundamental basics of exposing and consuming an API.  Book Club builds community through literature. Users can connect through groups, messaging, and a bountiful resource of books. Functionality is achieved by combining our own database, the Google Books API, and external communication APIs to allow real-time communication, discussions, and recommendations.

----------

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
- Breaking down a large project into small pieces
- Breaking down a problem into small steps
- Experience in 'sprints'
- GitHub workflow

----------

### Versions

- Ruby 2.7.2
- Rails 5.2.6

----------

### Important Gems

- Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/vajradog/faker-rails)

- API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers), [figaro](https://medium.com/@MinimalGhost/the-figaro-gem-an-easier-way-to-securely-configure-rails-applications-c6f963b7e993)


----------

## Database Schema

![Screen Shot 2022-02-22 at 10 31 07 AM](https://user-images.githubusercontent.com/87088092/155647400-97e86edd-30ad-4652-b53b-f26fd5ac429d.png)


----------

## APIs
Available endpoints

<h3> Books endpoint(s) </h3>

| name | data type | description | example |
| --- | --- | --- | --- |
| /books/:id | Integer | Returns details of a specific book based on the books id | /api/v1/books/{{book id}} | 
| /books/search | String | Returns a list of books with the title containing the search parameter | /api/v1/books/search?title={{search parameter}} |

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
Books by search expample used ("Pride"):
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


<h3> Quotes endpoint(s) </h3>

| name | data type | description | example |
| --- | --- | --- | --- |
| /quote | String | Returns a random literature quote | /api/v1/quote |

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


<h3> User endpoint(s) </h3>

| name | data type | description | example |
| --- | --- | --- | --- |
| /users | String | Returns all users | /api/v1/users |
| /users/:id | Integer | Returns a single user based on id | /api/v1/users/{{users id}} |

<details>
  <summary> JSON response examples </summary>
  
  
</details>


<h3> Clubs endpoint(s) </h3>

| name | data type | description | example |
| --- | --- | --- | --- |
| /clubs | String | Returns all clubs | /api/v1/clubs |
| /users/:id | Integer | Returns a single club based on id | /api/v1/clubs/{{club id}} |

<details>
  <summary> JSON response examples </summary>
  
  
</details>


<h3> Comments endpoint(s) </h3>

| name | data type | description | example |
| --- | --- | --- | --- |
| /comments | String | Returns all comments | /api/v1/comments |


<details>
  <summary> JSON response examples </summary>
  
  
</details>


----------

## **Contributors** ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

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
