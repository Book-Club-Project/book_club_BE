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

| name | data type | description | example |
| --- | --- | --- | --- |
| /books/:id | Integer | Returns details of a specific book based on the books id | /api/v1/books/{{book id}} |
| /books/search | String | Returns a list of books with the title containing the search parameter | /api/v1/books/search?title={{search parameter}} |
| /quote | String | Retruns a random literature quote | /api/v1/quote |
| /users | String | Returns all users | /api/v1/users |
| /users/:id | Integer | Returns a single user based on id | /api/v1/users/{{users id}} |



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
