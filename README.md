## Bluemix Rails 3.2 Demo App

This is an example application which can be run on Bluemix using the Rails 3.2

This demonstration illustrates an application leveraging the Twilio API on IBM Bluemix.

### Deploy this app:

####  Automatically by clicking this image: 

[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy)

#### Manually as follows:

1. Clone the app (i.e. this repo)

  ```
  git clone https://github.com/IBM-Bluemix/bluemix-rails-3.2.git
  cd bluemix-rails-3.2
  ```

1. If you don't have one already, create a MySQL service.  With Bluemix, the following command will create a free MySQL databse.

  ```bash
    cf create-service mysql 100 mysql-db
  ```

1. Edit the manifest.yml file.  Change the application 'name' attribute to something unique.

1. Push to Bluemix with the updated `manifest.yml`.

  ```bash
  cf push
  ```  

Access your application URL in the browser.  The default route will land you on the contacts page where you will need to create two or more contacts to actually use the application.
  
When you navigate to the "Calls" route you will be prompted to enter your Twilio credentials.  You'll need at least a `sid` a `secret` and a `from number` (a phone number either issued or validated by Twilio).

### Database Details

Previously with this example, it was necessary to create the database manually.  Now this happens automatically when you push the application.  Here's how this works.

1. The app is pushed & stages.
1. Your MySQL service is bound to the app.
1. The app droplet is run.
1. The db migration scripts execute.
1. The app itself starts.

The migration scripts use the technique described [here](http://zacharyflower.com/2013/08/12/getting-started-with-codeigniter-migrations/).


[MySQL client]:http://dev.mysql.com/doc/refman/5.6/en/mysql.html
