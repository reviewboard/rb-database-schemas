Review Board Database Schemas
=============================

This is a collection of database schemas for Review Board, going back several
versions. This is intended for *testing purposes only* and is **not** meant to
be used for any production use.


Organization
============

All SQL schema dumps are organized by Review Board release, database + version,
and install state, in the following hierarchy:

* `releases`
  * `<reviewboard-release>`
    * `<dbengine>-<version>`
      * `<state>.sql`
	  * `sitedir.tar.gz`


States include:

* `new-install.sql` - Brand new install at that version.
* `upgrade-from-X.Y.Z.sql` - Upgrade from version `X.Y.Z` to this version.
* `bad-install-<reason>.sql` - A bad install that broke upgrades (to test
  upgrade fixes).

States can also include suffixes before the `.sql`:

* `-with-powerpack` - Brand new install with Power Pack installed.

These are not all available at the time of this writing.

A site directory tarball corresponding to that version and database must also
be created. See below for how to build these.


Including New Site Directories
==============================

Please perform the following steps to include a site directory for each
database you're providing a SQL dump for:

1. Create the initial database.

2. Run ./scripts/prepare-sitedir.sh and answer the database questions.

3. Copy the resulting file to the right place in the tree.


Including New Schema Dumps
==========================

Please perform the following steps before including a new schema dump:

1. Dump the database generated above.

2. Edit the schema dump. Ensure no credentials or confidential information is
   present.

3. In the schema dump, look for the siteconfig data (containing
   `site_static_root`):

   Change the value for `site_static_root` to `/tmp/sitedir/htdocs/static/`.

   Change the value for `site_media_root` to `/tmp/sitedir/htdocs/media/`.

   Change the version to be the expected Review Board version (it's common for
   it to show, say, `4.0.6 alpha 0 (dev)` or `4.0.7 alpha 0 (dev)` for `4.0.6`
   if making a schema dump just prior to or after a release.

4. Inspect the schema dump, searching for your username or your home directory
   or similar, to make sure the SQL processed correctly. Change anything else
   to be based off of `/tmp/sitedir/`.

5. Place the file in the appropriate directory.
