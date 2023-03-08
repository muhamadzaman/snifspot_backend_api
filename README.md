# Welcome

* Ruby version
    ruby '3.0.5'
* Configuration
    run bundle install
    Project is using mysql you need to configure mysql on your machine and make sure that mysql server is running.
* Database creation
    create database using command 'rails db:create'
* Database initialization
    run migrations using command 'rails db:migrate'
* About
    It is limited version feature of this page : sniffspot.com/listings/seattle-wa
    Where a user can add a spot for the park with the details and description of the park including price. User can also add their reviews about their experience on that spot so other can see that.
* Schema of the project
    This project has two following tables:
    table_name: spot, Attributes: [ title: string, description: text, price: decimal, images: json ]
    table_name: reviews, Attributes: [ rating: decimal, review_comment: string, spot_id: integer ]
