# Sounding Board

Frontend hosted at https://sounding-board-frontend.herokuapp.com/

Backend hosted at https://sounding-board-backend.herokuapp.com/

A business idea discussion board application built using React + Redux frontend and Node.js + Express.js + PostgreSQL backend. The site allows users to pitch ideas, categorize them by tags and offer feedback.

## Background

### The Problem

Business ideas can be quick to come up with, and it is easy to convince oneself of their value. What's harder is predicting whether there is a strong enough need in the marketplace to allow your eventual product to succeed. Investing considerable time, effort and capital into an idea only to see it stagnate at release is a common nightmare scenario.

### The Solution

Sounding Board is one solution to tackle this problem. At our site users with preliminary business ideas can pitch them to their fellow users and benefit from crowd-sourced feedback. In addition to offering the pitchman a degree of insight into the idea's general appeal, collecting feedback from multiple different perspectives can illuminate areas of improvement that the pitchman had not thought of.

The end result is that the pitchman either moves forward with confidence in an idea that is stronger for its feedback, or they recognize the inviability of the idea at a very early stage and are able to return to the drawing board without expending unnecessary time, effort or money.

As the site offers categorizing ideas by tags and sorting by date and both short-term and long-term popularity, there is also an added benefit that users looking to utilize their talents (development, marketing, management, etc.) to bring ideas to fruition can quickly discover their favorite ideas and get in on the ground floor.

## Features

- User accounts and authentication
- Idea creation, modification and deletion
- Adding/removing tags from ideas
- Feedback creation/deletion
- Text-based and tag-based filtering of ideas
- Sorting of ideas by newest, top or rising

## Getting Started

### Prerequisites

The following should be installed before attempting to setup a copy of this project.

```
Node.js (v11+)
PostgreSQL (v10.5+)
npm
```

### Installing

After cloning this repository:

```
cd backend
```

```
npm install
```

```
createdb sounding-board
```

```
psql sounding-board < seed.sql
```

```
npm start
```

Will start the backend server.

While:

```
cd frontend
```

```
npm install
```

```
npm start
```

Will start the frontend application

## Deployment

This project currently has a deployed demo, with both a [frontend](https://sounding-board-frontend.herokuapp.com/) and a [backend](https://sounding-board-backend.herokuapp.com/) deployed on Heroku.

## Built With

### Frontend

- [React](https://reactjs.org/docs/getting-started.html) - UI Framework
- [Redux](https://redux.js.org/) - State Management

### Backend

- [Node.js](https://nodejs.org/en/) - The JavaScript Runtime
- [Express.js](https://expressjs.com/) - The Web Framework
- [PostgreSQL](https://www.postgresql.org/) - The Relational Database

## Future Work

In the medium-term I intend to create alternative versions of the backend API using Python/Flask and Java/Spring as an exercise in working with through the quirks of each language/framework to allow the frontend to agnostically consume them.
