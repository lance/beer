# Beer

A simple Sinatra application demonstrating the use of dm-infinispan-adapter on TorqueBox.
For more information, see these resources

* http://torquebox.org
* http://github.rom/torquebox

To run this app, follow the steps below.  

## Using torquebox-server &amp; RVM

The output from most of the following commands has been removed in favor of brevity. None should fail.

<pre>
<code>
$ source .rvmrc 

$ jruby -S -J-Xmx1024m gem install torquebox-server --pre --source http://torquebox.org/2x/builds/LATEST/gem-repo/

$ gem install bundler

$ bundle install

$ torquebox
Tasks:
  torquebox deploy ROOT     # Deploy an application to TorqueBox
  torquebox undeploy ROOT   # Undeploy an application from TorqueBox
  torquebox run             # Run TorqueBox
  torquebox cli             # Run the JBoss AS7 CLI
  torquebox env [VARIABLE]  # Display TorqueBox environment variables
  torquebox help [TASK]     # Describe available tasks or one specific task


$ torquebox deploy .
Deployed: beer-knob.yml
    into: /Users/lanceball/.rvm/gems/jruby-1.6.4@beer/gems/torquebox-server-2.x.incremental.492-java/jboss/standalone/deployments

$ cat /Users/lanceball/.rvm/gems/jruby-1.6.4\@beer/gems/torquebox-server-2.x.incremental.492-java/jboss/standalone/deployments/beer-knob.yml
--- 
application: 
  root: /Users/lanceball/dm-ispan-preso/beer
environment: {}


 $ torquebox run
</code>
</pre>


## Using torquebox-dist-bin.zip

Download the torquebox distribution from [torquebox.org](http://torquebox.org/2x/builds/torquebox-dist-bin.zip)
and unzip it someplace handy.

<pre>
<code>
$ cd torquebox-torquebox-2.x.incremental.492
$ export TORQUEBOX_HOME=`pwd`
$ export JBOSS_HOME=$TORQUEBOX_HOME/jboss
$ export JRUBY_HOME=$TORQUEBOX_HOME/jruby
$ export PATH=$JBOSS_HOME/bin:$JRUBY_HOME/bin:$PATH

# Go back to the beer app

$ cd ../beer

$ jruby -S bundle install

$ jruby -S rake -T
rake torquebox:archive               # Create a nice self-contained applica...
rake torquebox:check                 # Check your installation of the Torqu...
rake torquebox:deploy[context_path]  # Deploy the app in the current directory
rake torquebox:deploy:archive        # Create (if needed) and deploy as app...
rake torquebox:freeze                # Freeze application gems
rake torquebox:run                   # Run TorqueBox server
rake torquebox:undeploy              # Undeploy the app in the current dire...
rake torquebox:upstart:check         # Check if TorqueBox is installed as a...
rake torquebox:upstart:install       # Install TorqueBox as an upstart service
rake torquebox:upstart:restart       # Restart TorqueBox when running as an...
rake torquebox:upstart:start         # Start TorqueBox when running as an u...
rake torquebox:upstart:stop          # Stop TorqueBox when running as an up...

$ jruby -S rake torquebox:deploy

$ jruby -S rake torquebox:run

</code>
</pre>


