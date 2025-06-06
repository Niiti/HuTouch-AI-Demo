[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/user/repo/actions)


#  For developers, AI is still unreliable 😤

In spite of AI's help, we still spend 40% of our effort in boring coding and non-coding tasks. Places where our hard earned skills are being wasted are:
- Boilerplate coding based on project specs, or effort to create PRD, or vibe coding
- Fix code generated to have proper coding standards and clean code
- Stress out on changes to code that already works on existing app
- Dig up task info from different tools to identify tasks, write status emails, document daily log
- Search for most relevant articles/tutorials to elevate skills

Developers are looking for an end to end or a full-stack solution to help with their immense workload. 

## HuTouch 🌟 Automate manual coding, vibe coding and other boring tasks

At Niiti, we built HuTouch that solves this without vibe coding, and can be used on your existing code or to start off a new project. 
And then to top it, we added assistant skills. 
This helps developers save > 25% effort daily. Here is how:
- Automates coversion of project specs like, designs from Figma, API from Postman, functionality from requirements doc to a functional app
- Provides large code base and also works with small code base
- Generates highly reliable code where your personalized coding standards are used
- Establishes context, reuses existing code to generate new code   
- Removes chaos by digging up scattered info on task management, self review, write emails, summarize conversations
- Integrates into your daily workflow using your tools like, IDE (VS Code/Android Studio), Figma, Motiff, Postman, Jira, Google apps, Slack, etc  

Our vision is to help developers put a dent in their workload so that they can #DoWhatMatters most. [💎Sign-up for early access](https://share.hsforms.com/1zMNWuJJnQYWjq_SWLnUptweb6am) 

HuTouch is in it's early stage and is currently built only for Flutter mobile apps: https://youtu.be/ijHEK_wPsAA?si=iAOoP0DpnVDiqwfW 

## 🎯 What are Developers saying?

- “A few mins wait was worth to see HuTouch save 60% effort in boilerplate coding” – Atliq Technologies​

- "70-80% of my boring coding tasks are automated" - Champhunt (Techstars 24)

Hop on to our discord server to provide feedback or just share your stories/apps: https://discord.gg/HJ376nkdwu 

## 📂 Sample Projects

Below are a few projects we built using HuTouch to demonstrate how HuTouch helped


| Project Name           | Results                     |
|------------------------|---------------------------------|
| [StreamFlix](https://github.com/Niiti/HuTouch-AI-Demo/tree/main/Streamflix)| 5 screens with 1 API @ 1.5hrs and >80% reusable code |
| [Youtube Clone App](youtube)| 5 screens with 1 API @ 1.25hrs and >85% reusable code |

---

## HuTouch - Install & Setup

### Steps to Install HuTouch: 
1. Download HuTouch App - Sign-up to get the build: [Sign-up](https://share.hsforms.com/1zMNWuJJnQYWjq_SWLnUptweb6am)
2. For MacOS:
2.1 Drag and drop the HuTouch files into your application folder
   2.2 After download, open the terminal and navigate to your application folder
   2.3 Check if HuTouch has been successfully added to the application folder
   2.4 Execute the command: xattr -cr /Applications/HuTouch_AI.app
4. For WinOS:
   3.1 Click “Install Certificate”
   3.2 Select “Local Machine” (not Current User)
   3.3 Click Next
   3.4 Choose “Place all certificates in the following store”
   3.5 Click Browse and select: Trusted People
   3.6 Click OK, then Next, then Finish -> You’ll see: "The import was successful"
   3.7 Now you can install the actual app. Double-click HuTouch_1.0.0.0_x64.msixbundle
   3.8 A window will open titled “App Installer”
   3.9 Click Install
   3.10 Wait for installation to complete
   3.11 The app will now be available from Start Menu (you can pin it).Open folder and then open the EXE file
5. Once the process finishes execution, open HuTouch app and follow the setup instructions

### Setup Plugins: Required to help HuTouch interact with your code
1. Setup plugins for IDE: Select the IDE you use and click on the button "Add VS Code extension" or "Add Android Studio extension"
2. Upon click of your preferred plugin, you'll be directed to HuTouch plugin website
3. Follow instructions to install the plugin

### Setup Coding Style: Required to generate reliable code
1. Open your reference project in your IDE
2. Click "Extract" button to allow HuTouch to analyze the code and generate coding standards from it
3. Give HuTouch a few mins to do so
4. Once done, HuTouch will allow you to review & update the coding standards on the screen

### Access to Tools: Some are Required to generate tailored code
1. Select tools one at a time, like Figma, Postman, Jira, Slack that you use for coding and non-coding tasks
2. HuTouch will display instructions for each tool
3. Follow the instructions to provide access to HuTouch

### Setup your project: To create context of code in your project
Step by step recording for this setup: https://drive.google.com/file/d/12igYgCVue3RLGr614zsHxP5udXNWaLTA/view?usp=drivesdk
1. Select the Figma you will be using for your new project and click the button
2. For existing project, provide the relevant Figma and click the button 

### Accessibility access: Required to allow HuTouch hotkeys to work
1. Read the instructions on the screen
2. Click button to open your MacOS settings
3. Follow the provided instructions and allow HuTouch to be accessible through Hotkeys

---

## HuTouch - How to use (also available on HuTouch Home Screen)

### Generate code for screens from scratch/large code base:
1. Open the Figma file that you will need to use and if possible keep your IDE open in the background
2. Use the Hotkey (CTRL+COMMAND+H) to call HuTouch Chatbot
3. Select "Generate code for screen/UI" or provide a prompt on the chatbot to generate code for a screen. Make sure to provide the screen name or follow the instructions on the screen
4. HuTouch will ask for Figma URL and screen name in Figma
5. HuTouch will ask for requirements documentation on the screen, alternatively you can allow HuTouch to look up the internet for relevant requirements for the screen
6. HuTouch will ask for confirmation on coding standards, which you can either update or re-use from your setup steps
7. HuTouch will next generate code and display a list of files that were added or modified
8. Files added: Select Review button to see the files added in your IDE
9. Modified flies: Select Review button to see the changes to existing files in IDE, review the same and accept the lines of code you want to proceed with

### Modify Code:
1. Open IDE for the project/code you want to modify
2. If there is a specific set of lines of code you want to modify, select the same. Else go to the next step
3. Use the Hotkey (CTRL+COMMAND+H) to call HuTouch Chatbot
4. Select the recommended actions on the screen and follow the instructions
5. To fix errors in a file, select "Error Fix" or provide a prompt and HuTouch will provide fixes to all errors in the file
6. To update the lines of code you selected, pick "Modify" and provide details in the prompt
7. To update a functionality on a screen/file, select "Modify" and provide the details of the change you need with the screen or file name
8. To add a functionality on a screen/file, select "Modify" and provide the details of the new functionality you need with the screen or file name

### API Integration:
1. Open Postman that has APIs of the project/screen you want to use
2. If you need integration with 3rd party APIs, then download the details of the 3rd party API as a document
3. Use the Hotkey (CTRL+COMMAND+H) on Postman to call HuTouch Chatbot
4. Select API integration or use the prompt to provide API integration details
5. HuTouch will ask if this is an internal or external (3rd party) API, select accordingly
6. Based on your selection either upload 3rd party API documentation or provide the API details
7. Give HuTouch a few mins to generate the code
8. HuTouch will next generate code and display a list of files that were added or modified for integrating with internal or external APIs
9. Files added: Select Review button to see the files added in your IDE
10. Modified flies: Select Review button to see the changes to existing files in IDE, review the same and accept the lines of code you want to proceed with

### Code Review:
1. Open IDE for the project/code you want to review
2. Use the Hotkey (CTRL+COMMAND+H) to call HuTouch Chatbot
3. Select "Review Code" or use prompt to ask HuTouch to review the code
4. HuTouch will then use the project in the IDE to review the code
5. HuTouch will recommend a list of categories with details that can help improve the code

### Continuous Learning:
1. Open IDE for the project/code you want to review
2. Use the Hotkey (CTRL+COMMAND+H) to call HuTouch Chatbot
3. Select "Continuous Learning" or use prompt to ask HuTouch to help you with personalized learning
4. HuTouch will then use the project in the IDE to understand areas to elevate coding skills
5. HuTouch will recommend a list of articles, tutorials with time required for each

### Task Priority:
1. On your desktop or Jira or any tool, use the Hotkey (CTRL+COMMAND+H) to call HuTouch Chatbot
2. Select "Task Priority" or use a prompt to ask HuTouch to help with important tasks for the day
3. HuTouch will then look at all the connected apps and display a list of tasks important for the day
