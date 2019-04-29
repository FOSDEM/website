# Search service

This collection of scripts makes up the search service for our website. It will
allow you to update the index by passing your data to the `solrize` script, and
it will process queries and render them in the desired layout using the
`searcher.rb` script.

## Solr schema

The default Solr schema needs to be modified to contain our data and allow us to
query it the way we want.

An sample script to create the schema is provided in `schema/create.sh`.

## Populating the index

The index is populated with the `nanoc index` command. More information on how
to use that command can be found in the site's documentation.

The `nanoc index` command will call the `solrize` script. The first argument
passed to the script can optionally be the core to load the data into. It will
accept either `production` or `staging` as values, with the latter being the
default. Anything else you feed it through STDIN will be processed as the data
to load.

Before processing the data, it will attempt to fetch a template file from
`https://(staging.)fosdem.org/searcher/layout.rhtml` and save it as the layout
to render the search results in. This ensures the used layout is always the most
recent one.

Next, it will throw away any existing data in the core, and proceed with loading
the fresh data.

Note that you will need to configure `sshd` to have a `ForceCommand` directive
for the user you are running `solrize` as. It could look somewhat like this:

```
Match User solr
AllowAgentForwarding no
AllowTcpForwarding no
ForceCommand /opt/solr/service/searcher/solrize
PubkeyAuthentication no
```

This will work in our case, as we use Kerberos tickets to authenticate our
users.

## Searcher service

The searcher service expects to be called with a parameter `q` which should
contain the search query. It will pass the query to the Solr instance and render
the results in the template at `layout/<environment>.rhtml`, where environment
is the value of the `:environment` symbol. Typically, this will either be
`staging` or `production`.

The two `*.ru` files are `rackup` files, which will define the environment, tell
the script where it can find the Solr core to query and configure the port to
listen on.

You will need to have some kind of webserver to run this script. We are using
`puma`, but something like `thin` should work just as well.

Running the service is as easy as running the command below:

```
usr/bin/puma /opt/solr/service/searcher/production.ru
```

An example `systemd` unit file can be found in the `init/systemd` file.
