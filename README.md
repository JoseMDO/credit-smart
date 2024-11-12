# Credit Smart

  Credit Smart is an educational tool that allows consumers to realize the potenital of making their everyday purchases with a credit card in comparison to a debit card. It also gives them a breif overview of the benefits that come with using credit cards as well as some tips and tricks to take full advantage of the perks of having one. This application is for people who are not too well educated about the benefits of credit cards and the potential they hold. 


## Table of Contents
- [Main Features](#main-features)
- [Technologies Used](#technologies-used)
- [Services Used](#services-used)
- [Installation](#installation)
- [Contribution Guidelines](#contribution-guidelines)
- [FAQ](#faq)

## Main Features

---

### Total Cash Back Visualization

  * As a user, you can add as many transactions as you would like to add and the tool will show you multiple different credit card options and how much cash back you would get in total for all of your transactions combined. The calculations are made based on a few factors, each credit card has a rewards system, it takes in the category of the transaction, and then it has a certain percentage that this certian category gets back. It will calculate that specific total for each transaction and add them all together for each card that is available. For example, Chase Freedom Unlimited will give you 1.5 percent back on the "All" category, so a transaction that has the "All" category attached to it will calculate the total amount of the transaction times 1.5 percent to get the cash back for that transaction.

[![Watch the video](https://github.com/JoseMDO/credit-smart/assets/112668683/ac355339-3874-4bef-b6f5-a0ffbf16ed03)](https://youtu.be/dlCW2HH_YKw)


### Individual Cash Back Visualization

* As a user, you can also see individual cash backs for each transaction you add. It takes the same approach as the calculation for seeing all trasnaction totals but just shows the total for the selected transaction. In case a user would like to see how much they get back just for that individual categroy of transaction.

[![Watch the video](https://github.com/JoseMDO/credit-smart/assets/112668683/3342ef2c-ec5c-4f23-ba7b-80b59a8192ee)](https://youtu.be/E7sjI4x3r-8)


### Favorite Credit Cards

  * A user can add certian cards that they like to their favorites, which when on the favorites page, will only show those specific credit cards that they chose. This allows a user to compare and contrast the cash back of only the cards they would like to see instead of seeing all of them. Makes it simpler for the user to narrow down their credit card choices. This feature will become more useful once I am able to gather all of the credit cards out there and then there are dozens of cards to look through. 

[![Watch the video](https://github.com/JoseMDO/credit-smart/assets/112668683/af5c1626-1ca3-49cf-9474-659c27d44b23)](https://youtu.be/S8q_jxytiCM)

## Technologies Used
---

This is a base Ruby on Rails repository configured for learning with Codespaces (and Gitpod).

- Ruby version: `3.2.1`
- Rails version: `7.0.4.3`
- Boostrap version `5.3.1`

We've added additional Ruby gems and other software that aren't automatically available in a new Rails app.

### Additional gems:

- [`appdev_support`](https://github.com/firstdraft/appdev_support)
- [`annotate`](https://github.com/ctran/annotate_models)
- [`awesome_print`](https://github.com/awesome-print/awesome_print)
- [`better_errors`](https://github.com/BetterErrors/better_errors)
- [`binding_of_caller`](https://github.com/banister/binding_of_caller)
- [`dotenv-rails`](https://github.com/bkeepers/dotenv)
- [`draft_generators`](https://github.com/firstdraft/draft_generators/)
- [`draft_matchers`](https://github.com/jelaniwoods/draft_matchers/)
- [`devise`](https://github.com/heartcombo/devise)
- [`faker`](https://github.com/faker-ruby/faker)
- [`grade_runner`](https://github.com/firstdraft/grade_runner/)
- [`htmlbeautifier`](https://github.com/threedaymonk/htmlbeautifier/)
- [`http`](https://github.com/httprb/http)
- [`pry_rails`](https://github.com/pry/pry-rails)
- [`rails_db`](https://github.com/igorkasyanchuk/rails_db)
- [`rails-erd`](https://github.com/voormedia/rails-erd)
- [`rspec-html-matchers`](https://github.com/kucaahbe/rspec-html-matchers)
- [`rspec-rails`](https://github.com/rspec/rspec-rails)
- [`rufo`](https://github.com/ruby-formatter/rufo)
- [`specs_to_readme`](https://github.com/firstdraft/specs_to_readme)
- [`table_print`](https://github.com/arches/table_print)
- [`web_git`](https://github.com/firstdraft/web_git)
- [`webmock`](https://github.com/bblimke/webmock)
- [`simple_form`](https://github.com/heartcombo/simple_form)
- [`pundit`](https://github.com/varvet/pundit)
- [`csv`](https://github.com/ruby/csv)
- [`kaminari`](https://github.com/kaminari/kaminari)
- [`ransack`](https://github.com/activerecord-hackery/ransack)
- [`rails_admin`](https://github.com/railsadminteam/rails_admin)
- [`sassc-rails`](https://github.com/sass/sassc-rails)
- [`sprocket_rails`](https://github.com/rails/sprockets-rails)


## Services Used
---
* Rewards Credit Card API

## Configuration 

To configure your application to use the Rewards Credit Card API, follow these detailed steps:

#### 1. Generate a Master Key
If you do not already have a `master.key` file, you can generate one by running:
```bash
EDITOR="code --wait" rails credentials:edit
```

This command will open the credentials file in Visual Studio Code (replace "code --wait" with your preferred editor), and a new master.key file will be generated automatically if it does not exist.

#### 2. Add Rewards Credit Card API Tokens
Inside the opened credentials file, add your API tokens and other sensitive configuration variables in a structured format. For example:

```yaml
rewards-credit-card:
  X-RapidAPI-Key: YOUR_RAPID_API_ACCESS_KEY
  X-RapidAPI-Host: YOUR_RAPID_API_HOST

```

Save and close the file. The changes will be encrypted and saved securely, accessible only via the master.key.

#### 3. Ensure the Security of the Master Key
Never commit your master.key or the credentials file to version control. Add the master.key to your .gitignore file to prevent it from being accidentally pushed to your repository:
```bash
echo 'config/master.key' >> .gitignore
```
## Installation
---
### Current Main Branch: rails 7 
* Clone the repository and switch to the main branch
* Run the following commands

```sh
bundle install
rails db:migrate
rails slurp:categories
rails slurp:credit_cards
rails slurp:rewards
rake sample_data
bin/dev
```
After running the above commands you will have generated all the data needed to see the app functioning. The user Bob will have admin access, you can sign in with:

* Email: ``bob@example.com``
* Password: ``password``

### Entity Relationship Diagram
![Screenshot 2024-03-26 at 11 39 16 AM](https://github.com/JoseMDO/credit-smart/assets/112668683/bccb5e06-6436-47bf-97e6-222a6e59e720)


## Contribution Guidelines 
---
### Introduction
Thank you for your interest in contributing to **CreditSmart**. This document provides guidelines and instructions on how to contribute to the project.

### How to Contribute
1. **Setup your environment**: Follow the installation instructions above.

[Github Project Link](https://github.com/users/JoseMDO/projects/1)

2. **Find an issue to work on**: In the Projects tab, check out our issues, we continue to add new issues daily and feel free to create your own issues as well.
 

### Coding Conventions
We adhere to the Ruby community style guide, and we expect all contributors to follow suit. Here are key conventions specific to our project:

- **Code Style**: Follow the [Ruby Style Guide](https://rubystyle.guide/), which provides detailed guidelines on the coding style preferred by the Ruby community.
- **Naming Conventions**:
  - Use `snake_case` for variables, methods, and file names.
  - Use `PascalCase` for class and module names.
  - Reflect domain concepts accurately in naming. For instance, if you are working within a financial application, prefer names like `user_account_details` over vague terms like `data`.

- **Design Principles**: Focus on Domain-Driven Design (DDD):
  - Organize code to reflect the domain model clearly.
  - Use service objects, decorators, and other design patterns that help isolate domain logic from application logic.


### Comments and Documentation
- **Comment your code** where necessary to explain "why" something is done, not "what" is done—source code should be self-explanatory regarding the "what".
- **Document methods and classes** thoroughly, focusing on their roles within the domain model, especially for public APIs.

### Version Control Practices
- Commit messages should be clear and follow best practices, such as those outlined in [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/).
- Keep commits focused on a single issue to simplify future maintenance and troubleshooting.

### Branch Naming Conventions
Please use the following naming conventions for your branches:

- `<issue#-description>` (i.e 31-added-ransack-search)

### Pull Request Process
1. **Creating a Pull Request**: Provide a detailed PR description, referencing the issue it addresses.
2. **Review Process**: PRs require review from at least one maintainer.

### Community and Communication
Join our [Discord](https://discord.gg/ZnZCT9W8wD) to communicate with other contributors and maintainers.

Thank you for contributing to **Credit Smart**!



## FAQ
---

### Master Key Errors
* Be sure to follow the [Configuration Instructions](#configuration) if you encounter an issue when setting up the project.

### Rewards Credit Card API Setup
* For help with how to use the Rewards Credit Card API, see the [Rewards Credit Card API Documentation](hhttps://www.rewardscc.com/docs/)

### Ruby Version Errors
* The project is written using Ruby 3.2.1, if you encounter issues upon cloning, make sure you have Ruby version 3.1.1 in your environment.
