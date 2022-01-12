# Startup Investments

## About the Project

This app was created as a project for the class CS 3265 - Database Management Systems at Vanderbilt University.

The app uses the Crunchbase 2013 Snapshot © 2013 dataset from [Startup Investments](https://www.kaggle.com/justinas/startup-investments).

## Getting Started
To run the project locally, follow these steps.

### Prerequisities
* Install [MySQL](https://www.mysql.com/products/workbench/) and [Wampserver](https://www.wampserver.com/en/#download-wrapper)
* Install [Python 3](https://www.python.org/downloads/)

### Run the project
1. Navigate to "C:/wamp64/www/". Either move the startup-investments folder inside this folder, or clone the repo:
   ```sh
   git clone https://github.com/sarah-s-zhang/startup-investments.git
   ```
2. Download the raw dataset from [Kaggle](https://www.kaggle.com/justinas/startup-investments) and move the files into the "startup-investments/db/" folder.
3. In the command line, navigate to the "db/" folder and run the Python script to preprocess the data:
   ```sh
   python3 preprocess_data.py
   ```
   The script should create a new file called "objects_new.csv".
4. Run Wamp and MySQL, and then run "db/create_startup_info.sql". If the path on your computer to "C:/wamp64/www/" is different, then change all the LOAD DATA statements to reflect the correct file path.
5. In a web browser, go to http://localhost/startup-investments/application/index.html to view the website!


## Contact
Sarah Zhang - sarah.s.zhang@vanderbilt.edu

Ethan Piper - ethan.b.piper@vanderbilt.edu

Project Link: [https://github.com/sarah-s-zhang/startup-investments](https://github.com/sarah-s-zhang/startup-investments)

## Acknowledgements
* Dr. Singh, our CS 3265 professor.