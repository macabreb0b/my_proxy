## To run proxy server on Mac OSX

Go to System Preferences > Network > Advanced > Proxies

Check the box for 'Web Proxy (HTTP)', and enter:  
Web Proxy Server: 127.0.0.1 # => this is localhost  
Port: 8080

It's OK to leave the rest as-is.

Hit OK, then hit Apply.

Then, in terminal, navigate to the directory containing this README, and run:

$ ruby my_server.rb

Now you should be able to visit your favorite (non-https) websites!  
Try it out: http://sfbay.craigslist.org/

* Hit ctrl+c or quit terminal to stop the proxy server at any time, but don't forget to uncheck all proxies in System Preferences again if you want network access!

## To test caching

To view it in practice - use your browser to visit any (non-https) page:  
http://en.wikipedia.org/wiki/Main_Page

After visiting the page, hit refresh, or visit the same url again.

You should see "This is a cached item" at the top of the page, and there will be no network request made.

* This server does not support CONNECT, POST, PUT or DELETE requests