# TourHunter API

> TourHunter API is the back-end project made by our 5-member group to give users options of tours around the world to reserve and the admins to add and delete said tours. General users can create an account to be able to reserve a tour and only admins will be able to create and delete tours. Feel free to fork this project and modify it for your own use!

## Deployment

You can find the app live [here](https://tourhunterapp.herokuapp.com
)

## Documentation

> Here you can review the documentation of the API:

[API Documentation](https://tourhunterapi.herokuapp.com/api-docs/index.html)

## Front-end Repository

You can find the back-end API [here](https://github.com/leopiresgoss/tour-hunter).

## Built With

- _**Ruby 3.1.2**_
- _**Ruby on Rails  7.0.3**_
- _**Devise  4.8.1**_
- _**Devise-JWT 0.9.0**_
- _**Pg 1.2.1**_
- _**Cloudinary 1.23.0**_
- _**Rspec-rails 5.1.2**_

## Getting Started

### To launch the project locally:

#### Step 1:

- Clone this repo locally using either github desktop or using the clone link provided by the green button on the top right.

- Alternatively, you can just download the complete zip file and extract the folder in your directory

#### Step 1:

- Set a [Cloudinary](https://cloudinary.com) account and a add cloudinary.yml with your credentials in the `config` folder
- In `.env` file, add your own credentials: 
    - The master_pwd should be your mailer password to send confirmation emails.
    - The DEVISE_JWT_SECRET_KEY shoul be generated running the command: `bundle exec rails secret`

- Alternatively, you can just download the complete zip file and extract the folder in your directory



#### Step 2:

- Download all dependencies to use the Project

```bash
> bundle install
> rails db:create
> rails db:setup
```

#### Step 3:

In the project directory, you can run:

##### `rails s`

## Kanban Board

 - Link to the completed Tour Hunter [Kanban Board](https://github.com/leopiresgoss/tour-hunter-api/projects/1)
 - Link to the screenshot of initial [Kanban Board](https://user-images.githubusercontent.com/61767582/177650437-7a253b77-9ad3-4bb5-bc7b-a66f8e67fede.png)
 - Total members: 5

## Authors

👤 **Mengstu Fentaw**

- Github: [@mengiefen](https://github.com/mengiefen)
- Twitter: [@MengistuFentaw](https://twitter.com/MengistuFentaw)
- Linkedin: [@mengefen](https://www.linkedin.com/in/mengefen/)

👤 **Leonardo Pires Goss**

- GitHub: [@leopiresgoss](https://github.com/leopiresgoss)
- Twitter: [@leonardopgoss](https://twitter.com/leonardopgoss)
- Linkedin: [@leonardogoss](https://www.linkedin.com/in/leonardogoss/)

👤 **Thiago Allan Porro Ponce**

- GitHub: [@Thi-Ponce](https://github.com/Thi-Ponce)
- Twitter: [@Thi_ponce](https://twitter.com/Thi_ponce)
- LinkedIn: [@thiago-ponce](https://linkedin.com/in/thiago-ponce)

👤 **Behnam Aghaali**

- GitHub: [@Behnam1369](https://github.com/Behnam1369)
- LinkedIn: [@Behnam-Aghaali](https://www.linkedin.com/in/behnam-aghaali)
- Twitter: [@Behnamagh1369](https://twitter.com/behnamagh1369)

👤 **Yersel Hurtado**

- GitHub: [@yersel500](https://github.com/yersel500/)
- LinkedIn: [Yersel Hurtado](https://www.linkedin.com/in/yersel-hurtado/)
- Twitter: [@YerselHurtado](https://twitter.com/YerselHurtado)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome and highly encouraged!
We feel that your input is what helps us grow so you're always Welcome :)

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thank you to all our peers who helped us out through this wonderful journey at Microverse. 🌥️
- The creator of the design guidelines [Murat Korkmaz](https://www.behance.net/muratk) on Behance.

## 📝 License

This project is [MIT](https://github.com/leopiresgoss/tour-hunter) licensed.
