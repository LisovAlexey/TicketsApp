# Welcome

Hi there, thank you for start reading README first. The goal of current technical task is to bring developer into the environment which we all facing when joining a new team. Usually there is some architecture already exists in the project together with some awesome custom components, bugs and pieces of code which need to be refactored, but no-one had time to do it. 

So you are the lucky one, who can help with all open tasks.

The idea for the project is pretty simple. It's viewer of events with possibility to buy a ticket for it. Existing project contains only a skeleton based on MVVM+Coordinator pattern including some mock data. Your task is to implement some business logic as well as make refactoring.


# Use Cases
- As a user I want to see list of upcoming events sorted by date (descending)
- As a user I want to be able to sort events by price (both descending/ascending)
- As a user I want to filter out outdated events
- As a user I want to see details of concrete event
- As a user I want to be able to buy a ticket
- As a user I want to be able to view confirmation QR-code for a bought ticket
- As a user I want to see which tickets were bought already

# Design
There are no special design, but there are some requirements for each screen which data should be shown.
- Events overview screen should:
    - include list of events with title, date and price
    - should contain pull-down to refresh gesture to reload the data
    - buttons for sorting by date/price
    - button to filter out outdated events
- Event details screen should:
    - contain: title, event description, date of event, address, contact phone, buy button with price on it
    - by tapping on buy button loading indicator should be shown
    - after successful response navigate to ticket details screen
    - in case ticket was bought already, buy button should be changed to "Open ticket", and by clicking on it ticket details should be opened without any request
- Ticket details screen should:
    - contain: date of bought ticket, QR-verification code


# Dependencies
- Xcode 12.5 or higher
- SPM for 3rd party libs

# API dependencies
Documentation for API could be found in Postman collection in 'docs/EventsList.postman_collection.json' folder.

# TODO:

## Round 1 (Must have)

### Business logic tasks:
[ ] implement backend communication instead of MOCK samples (see Postman collection for reference)
[ ] fix date formatting on overview page to the following format: "05 August 2021"
[ ] show price value for each event
[ ] implement sorting by date and by price for overview screen


### Code refactoring tasks:
[ ] AppCoordinator.swift creates instances of VM and VC by itself, which makes this Coordinator hard to test with mock data. Please do refactoring to make this part more clear and testable.
[ ] Write UnitTest for sorting/filtering logic of events overview list

## Round 2 (Nice to have)

### Business logic tasks:
[ ] implement logic of filtering only upcoming events (events which are older than today do not show in the list)
[ ] implement event details screen

### Code refactoring tasks:
[ ] Increase Code coverage of ListOverviewViewModel.swift to 80+% (check ListOverviewViewModelTests.swift)

## Round 3 (You are the best!)

### Business logic tasks:
[ ] implement buying logic
[ ] implement ticket details screen

### Code refactoring tasks:
[ ]  add tests for AppCoordinator using Mocks instead of real VC and VM

# Good to know
- For UI layout feel free to use SnapKit library
- You are free to use any 3rd party library to solve the problems 
- Completed tasks please mark as [x] in this README
- As you see from above todo list, all tasks are splat by 3 rounds. First round is a required minimum, 2nd and 3rd are optional but nice to have. 
