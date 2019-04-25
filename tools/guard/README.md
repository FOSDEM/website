# Building the website in a loop

Assuming you have a working, building version of the website, the `build` script
in this directory will run the build process in a continuous loop.

## Running

The `build` script expects you to have a Kerberos keytab file to authenticate
itself with, and a version of the website that builds.

```
Usage: build -d <directory> -k <keytab> [-e <environment>] [-b <branch>] [-r <remote>]

  -b <branch>: git branch to build the website from (defaults to master)
  -d <directory>: where to find the website to build
  -e <environment>: staging or production (defaults to staging)
  -k <keytab>: location of the keytab file to use
  -r <remote>: git remote to pull from (defaults to origin)
```

## Obtaining a keytab file

To obtain a keytab, you will need the password for the principal you want to
authenticate as.

The example below works for Heimdal Kerberos:

```
ktutil -k you.keytab add -p you@EXAMPLE.COM -e aes256-cts -V 4
```

You will be prompted for the password, and if that worked, you will now have a
file called `you.keytab` in the current directory.

You will need to feed the path to the keytab to the `build` script using the
`-k` flag.

## RTAAS

In order to Run This As A Service, you could consider using `systemd` user
services.

First, make sure the website builds. A good way to verify this, is by running
the build script manually at least once.

You will need to enable lingering for the user you want to run the script as. As
an example, assuming the user is `nanoc`, you'll need to run the commands below.
Obviously, the package installation and `loginctl` configuration needs to be
done as root.

Also, because of Reasons, you will need to reboot the machine and have
`libpam-systemd` installed. If you're curious, the Reasons are that rebooting
will spawn a user manager for all user(s) you have enabled lingering for, and
for this to work, you need `libpam-systemd`.

```
# apt install libpam-systemd
# loginctl enable-linger nanoc
# reboot
```

Next, as user `nanoc`, you will need to create the `systemd` service directory.

```
$ mkdir -p ~/.config/systemd/user/

```

The actual unit file, we'll name it `nanoc.service`, should be dropped in the
directory you just created.

```ini
[Unit]
AssertPathExists=/srv/nanoc/website/

[Service]
WorkingDirectory=/srv/nanoc/website/
ExecStart=/srv/nanoc/website/tools/guard/build -d /srv/nanoc/website/ -k /srv/nanoc/nanoc.keytab -e production -b master -r origin
Restart=always
PrivateTmp=true
NoNewPrivileges=true

[Install]
WantedBy=default.target
```

Finally, as user `nanoc`, enable and start the service.

```
$ systemctl --user enable nanoc.service
$ systemctl --user start nanoc.service
```

Of course, you can run multiple versions of this service. A useful example could
be to continuously build the staging and production version of the website.

# Why?

## Why do you want to build the website in a loop?

Because our website pulls in data from Pentabarf. As we don't know when that
data changes, the safe road is to build it continuously. The smarter approach
would be to check Pentabarf's log, and only build if that has changes.
Contributions welcome!

## Why not use nanoc watch or autocompile, or guard-nanoc?

Because we haven't figured out how to make it do everything this script does.
Again, contributions welcome!
