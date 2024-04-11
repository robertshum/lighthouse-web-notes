# AWS EC2 to deploy HTTP servers

Using:

* AWS EC2
* tmux/pm2
* Express App (but really, any project that serves as http endpoint)
* ngrok (optional, reverse proxy to achieve https)

## Steps

1. EC2 -> Launch Instance
2. Ubuntu Free tier (22.04 LTS+)
3. Create key pair so we can SSH (rsa + pem)
4. Save certificates to safe location
5. Security group, option to allow https traffic.  Otherwise leave it alone.  Allow SSH traffic from 'anywhere'
6. Launch instance...wait
   * Note the public IPv4 address given 
7. Select instance, connect (top right corner), select SSH client, follow the steps to SSH into server
8. Install Tmux (for multi window cmd line support)
   1. Update system ```sudo apt update```
   2. Install tmux ```sudo apt install tmux```
9. EC2 Node Setup
   1.  Install Node/npm
   2.  Install curl on Ubuntu server: ```sudo apt-get install curl```
   3.  Download nodeJs: ```curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -```
   4.  Install Node: ```sudo apt-get install nodejs```
10. Install Express Web App
    1.  Clone your back-end project
    2.  Navigate to project folder, then: ```npm i```
    3.  Create a new tmux session
    4.  Launch the project, note the port being used
    5.  Exit the tmux session
    6.  Safe to close the SSH client window
11. Update Security Policy
    1.  Select instance in AWS EC2
    2.  Select the security group, edit inbound rules
    3.  Add rule, TCP, port from previous step, from anywhere
    4.  Save
12. Enjoy your new http endpoint
13. Optional - HTTPS without cert using ngrok
    1.  Install ngrok: ```https://dashboard.ngrok.com/get-started/setup/linux```
    2.  Add authentication token in setup steps
    3.  Tmux into a new session
    4.  Create ngrok https route to http in tmux session: ```ngrok http http://localhost:PORT_TO_SERVICE_HERE```
    5.  Verify endpoint is created from dashboard
14. Test out the fresh new https reverse proxy endpoint!
    
## Useful Commands

SSH into a EC2 instance (while certificate in same dir as command):

```bash
ssh -i "name_of_cert.pem" ubuntu@ec2-ip-address.us-west-2.compute.amazonaws.com
```

TMUX:

- Start (and connect to) a new named session: ```tmux new-session -s session_name```
- Detach from any session as described above: ```Ctrl+B, D.```
- List all active sessions: ```tmux list-sessions```
- Connect to a named session: ```tmux attach-session -t session_name```
- Kill/stop a session:
  - exit command while in session or,
  - ```tmux kill-session -t session_name```
- More info here: https://stackoverflow.com/questions/21193988/keep-server-running-on-ec2-instance-after-ssh-is-terminated

## Notes:
- If using ngrok, make sure to bypass warning with headers:
  
```javascript
fetch(url, {
      method: "get",
      headers: new Headers({
        "ngrok-skip-browser-warning": "69420",
      }),
    })
    //...
```

- Should be able to rename your endpoint variable to point to your http/https endpoint hosted in your ```.env``` file directly.
- Note that the front and back end must communicate using the same HTTP policy.  If one is using HTTP and another is HTTPS, browser will throw errors about mixed security policies.