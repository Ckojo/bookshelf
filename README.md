# Bookshelf

Bookshelf is a simple web application built with Hanami framework that allows users to manage and organize their book collections.

## Features

- Add new books to your collection with title and author information
- View and search through your existing book collection
- Edit or delete books from your collection
- Categorize books into different genres or tags

## Prerequisites

- Ruby (version 3.0.2)
- Hanami (version 2.0.3)
- PostgreSQL (version 14.8)

## Getting Started

Follow the steps below to run the Hanami Bookshelf app:

1. Clone the repository:

  ```
    git clone https://github.com/your-username/hanami-bookshelf.git
  ```
2. Navigate to the project directory
  ```
    cd bookshelf
  ```
3. Install the dependencies:
  ```
    bundle install
  ```
4. Create and migrate the database:
  ```
    hanami db prepare
  ```
5. Start the Hanami server:
  ```
    hanami server
  ```
6. Open your web browser and visit http://localhost:2300 to access the Hanami Bookshelf app.