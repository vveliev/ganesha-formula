.. _readme:

ganesha-formula
===============

|img_travis| |img_sr| |img_pc|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/ganesha-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/ganesha-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release
.. |img_pc| image:: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white
   :alt: pre-commit
   :scale: 100%
   :target: https://github.com/pre-commit/pre-commit

A SaltStack formula that is empty. It has dummy content to help with a quick
start on a new formula and it serves as a style guide.

.. contents:: **Table of Contents**
   :depth: 1

Getting started
---------------

Available states
^^^^^^^^^^^^^^^^
.. contents::
   :local:

``ganesha``
~~~~~~~~~~~

*Meta-state (This is a state that includes other states)*.

This installs the ganesha package,
manages the ganesha configuration file and then
starts the associated ganesha service.

``ganesha.package``
~~~~~~~~~~~~~~~~~~~
This state will install the ganesha package only.

``ganesha.config``
~~~~~~~~~~~~~~~~~~~

This state will configure the ganesha service and has a dependency on ``ganesha.install``
via include list.

``ganesha.service``
~~~~~~~~~~~~~~~~~~~
This state will start the ganesha service and has a dependency on ``ganesha.config``
via include list.

``ganesha.clean``
~~~~~~~~~~~~~~~~~

*Meta-state (This is a state that includes other states)*.

this state will undo everything performed in the ``ganesha`` meta-state in reverse order, i.e.
stops the service,
removes the configuration file and
then uninstalls the package.

``ganesha.service.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~

This state will stop the ganesha service and disable it at boot time.

``ganesha.config.clean``
~~~~~~~~~~~~~~~~~~~~~~~~

This state will remove the configuration of the ganesha service and has a
dependency on ``ganesha.service.clean`` via include list.

``ganesha.package.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~

This state will remove the ganesha package and has a depency on
``ganesha.config.clean`` via include list.

``ganesha.subcomponent``
~~~~~~~~~~~~~~~~~~~~~~~~

*Meta-state (This is a state that includes other states)*.

This state installs a subcomponent configuration file before
configuring and starting the ganesha service.

``ganesha.subcomponent.config``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This state will configure the ganesha subcomponent and has a
dependency on ``ganesha.config`` via include list.

``ganesha.subcomponent.config.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This state will remove the configuration of the ganesha subcomponent
and reload the ganesha service by a dependency on
``ganesha.service.running`` via include list and ``watch_in``
requisite.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``ganesha`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.
