# Introduction

### Nathen Harvey

* Community Director at Chef
* Co-host of the Food Fight Show Podcast
* Meetup Organizer
  * DevOpsDC
* Occasional farmer [http://bit.ly/farmer-nathen](http://bit.ly/farmer-nathen)

* [@nathenharvey](https://twitter.com/nathenharvey)
* [nharvey@getchef.com](mailto:nharvey@getchef.com)

### Doing it live?

Google+ Hangout with live stream to YouTube?

### Demo

Kick off the demo to be shown at the end

Use knife-ec2 or chef-metal to launch a server.

* Awesome appliance repair
* Simple cluster with webservers and a load balancer
* update ssh policy or httpd port

### Who are you?

* System sdministrator?
* Developer?
  * Ruby developer?
* DevOp?
* Business person?

### Who are you?

* Experience with Configuration Management / Infrastructure as Code?
* Experience with Chef?

### Which version control system do you use?

* cp foo foo.bak
* cp foo{,.`date +%Y%m%d%H%M`}
* cp foo{,.`date +%Y%m%d%H%M`-`$USER`}

# Infrastructure as Code

### Evolution of a System Administrator

* ssh into a server and start banging around
* store notes in ~/server.txt
* move notes to the wiki
  * nervous when you hit enter
  * smart when you hit save
  * despondent when you realize the wiki is now a lie
* start writing some scripts (setup.sh, etc.)
* golden images
* Need an automation framework!
  * policy-driven configuration management

### Benefits of Automation

* speed
* scale
* consistency

### Dimensions of Scale

* Number of servers
* Staff
* Time to market
* Complexity

### Automation Platform

* Creates a dependable view of your entire network’s state.
* Can handle complex dependencies among the nodes of your network.
* Is fault tolerant.
* Is secure.
* Can handle multiple platforms
* Can manage cloud resources
* Provides a foundation for innovation

### Infrastructure as Code

* Programmatically provision and configure components
* Treat like any other code base
* Reconstruct business from code repository, data backup, and compute resources

### Polciy-based

* You capture the policy for your infrastructure in code
* A program ensures each node in your infrastructure complies with the policy
* A control loop keeps the system stable and allows for change when policy is updated

### Golden Images vs. Policy-based

* Typical Infrastructure
* New compliance mandate
* 6 Golden Images updates
* 12 instance replacements
* Completed during maintenance windows
* Configuration has changed

# Chef

### What is Chef?

* Framework for managing your infrastructure as code
  * policy driven automation
  * open source
* A community
* A company

### Desired Configuration

A section that describes the proces the node goes through to converge on the desired configuration.

### Search

The server holds both policy and **state** of the infrastructure.  Show a demonstration of how the state of the infrastructure can help drive search.

# Building your policy

Policy is defined as a collection of **resources** in **recipes**.  There are lots of abstractions on top of this but *resources* are the basic building blocks.

### Resources
* Piece of the system and its desired state
  * Package that should be installed
  * Service that should be running
  * File that should be generated
  * Cron job that should be configured
  * User that should be managed
  * And more
* docs.getchef.com/chef/resources.html

### Hello, Chef!

* **Open in editor** `~/hello_chef.rb`

      file "/tmp/hello_chef.txt" do
        content "Hello, Chef"
        mode "0777"
      end

### Apply the policy

      $ sudo chef-apply hello_chef.rb

      Recipe: (chef-apply cookbook)::(chef-apply recipe)
        * file[/tmp/hello_chef.txt] action create
          - create new file /tmp/hello_chef.txt
          - update content in file /tmp/hello_chef.txt from none to 79c290
          --- /tmp/hello_chef.txt     2014-10-22 19:59:04.000000000 -0400
          +++ /tmp/.hello_chef.txt20141022-23075-19aelx1      2014-10-22 19:59:04.000000000 -0400
          @@ -1 +1,2 @@
          +Hello, Chef
          - change mode from '' to '0777'

### Resources

* Describe the desired state
* Do not need to tell Chef how to get there

* What happens when you re-apply the policy?

### Apply the policy

      $ sudo chef-apply hello_chef.rb

      Recipe: (chef-apply cookbook)::(chef-apply recipe)
        * file[/tmp/hello_chef.txt] action create (up to date)

### Resources

* A piece of the system
* Its desired state


      file "/tmp/hello_chef.txt" do
        content "Hello, Chef"
        mode "0777"
      end

### Change the state of the system

      $ echo “Hello, #ato2014” > /tmp/hello_chef.txt

### Apply the policy

      $ sudo chef-apply hello_chef.rb

      Recipe: (chef-apply cookbook)::(chef-apply recipe)
        * file[/tmp/hello_chef.txt] action create
          - update content in file /tmp/hello_chef.txt from e453df to 79c290
          --- /tmp/hello_chef.txt     2014-10-22 20:00:20.000000000 -0400
          +++ /tmp/.hello_chef.txt20141022-23340-17a7m5t      2014-10-22 20:00:50.000000000 -0400
          @@ -1,2 +1,2 @@
          -“Hello, #ato2014”
          +Hello, Chef

### Resources – Test and Repair

* Resources use a test and repair model

* Resource currently in the desired state?
  * Yes – Do nothing
  * No – Bring the resource into the desired state (repair)

### Built-in Resources

* package
* template
* service
* cron
* directory
* mount
* user
* group
* registry_key
* remote_directory
* route
* and many more...
* [docs.getchef.com/chef/resources.html
](http://docs.getchef.com/chef/resources.html
)


### Recipes

Policy is defined as a collection of **resources** in **recipes**.  There are lots of abstractions on top of this but *resources* are the basic building blocks.

### Sample Recipe

      package "httpd"

      template "/etc/httpd/conf/httpd.conf" do
        source "httpd.conf.erb"
        owner  "root"
        group  "root"
        mode   "0644"
        notifies :restart, "service[httpd]"
      end

      service "httpd" do
        action [:start, :enable]
      end

      file "/var/www/html/index.html" do
        content "Hello, ATO!"
      end

### Workflow

What does a test-driven infrastructure workflow look like?

# Hands-on

* test driving zero-to-hello world

# Wrap-up

### Build Anything

### Manage it Simply

### What questions do you have?

* AMA

* @nathenharvey
