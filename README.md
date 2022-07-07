Review Board Database Schemas
=============================

This is a collection of database schemas for Review Board, going back several
versions. This is intended for *testing purposes only* and is **not** meant to
be used for any production use.


Organization
============

All SQL dumps are organized by Review Board release, database + version, and
install state, in the following hierarchy:

* `releases`
  * `<reviewboard-release>`
    * `<dbengine>-<version>`
      * `<state>.sql`


States include:

* `new-install.sql` - Brand new install at that version.
* `upgrade-from-X.Y.Z.sql` - Upgrade from version `X.Y.Z` to this version.
* `bad-install-<reason>.sql` - A bad install that broke upgrades (to test
  upgrade fixes).

States can also include suffixes before the `.sql`:

* `-with-powerpack` - Brand new install with Power Pack installed.

These are not all available at the time of this writing.


Including New Dumps
===================

Please perform the following steps before including a new schema dump:

1. Start from a fresh install, and ensure no credentials or confidential
   information is in the dump.

2. Edit the dump file. Look for the siteconfig data (containing
   `site_static_root`):

   Change the value for `site_static_root` to `/site/htdocs/static/`.

   Change the value for `site_media_root` to `/site/htdocs/media/`.

3. Inspect the dump, searching for your username or your home directory or
   similar, to make sure the SQL processed correctly. Change anything else
   to be based off of `/site/`.

4. Place the file in the appropriate directory.
