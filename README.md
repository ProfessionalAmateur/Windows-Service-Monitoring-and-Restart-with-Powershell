Service Monitoring with Powershell
==================================

Overview
--------
This script will monitor a Windows service via Powershell and restart it if the service is not running.

We use Spiceworks to manage our helpdesk and IT infrastructure. Frequently we would find that the 'spiceworks' service would be stopped for one reason or another on the server, which prevented our users from entering helpdesk tickets (bad!).  

I did not want to implement something like Nagios to ensure everything is up and running due to the complexity and time necessary to do so properly.  Instead I wrote a small Powershell script that will check the status of a service and if it's not running send an email and attempt to restart the service. This gives IT a heads up there may be an issue with the server, and hopefully proactively get.s things running again without any intervention on our part.

Usage
-----
We have this called via Windows Scheduler every 15 minutes. For execution, run the script and pass the service name like so: `verify_service_status.ps1 [Service]`
