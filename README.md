# simple-blog
Simple copy of Twitter

<p align="center">
<img scr="https://github.com/user-attachments/assets/cdd6d065-b3b8-40bb-87fc-d167defbcf31">
</p>


## Installation

Ensure you have Ruby on Rails installed. Then, install the required gems:

```sh
bundle install
```

Set up the database:

```sh
rails db:create db:migrate db:seed
```

## Running the Application

To start the application, run:

```sh
bin/dev
```

By default, the application will be available at `http://localhost:3000`.

## Features

- User authentication and account management via `Devise`.
- Users can create, edit, and delete posts.
- Users can leave comments on posts.
- Image zooming functionality using `bs5-lightbox`.
- Avatar image resizing using `mini_magick`.

