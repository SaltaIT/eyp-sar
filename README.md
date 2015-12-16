# sar

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What sar affects](#what-sar-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sar](#beginning-with-sar)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

Installs the sar package.

## Setup

### What sar affects

* Installs sar
* In Ubuntu 14 controlls /etc/default/sysstat content, it will overwritten.

### Beginning with sar

Example of the standard configuration:
```puppet
class sar {
  ensure  => 'installed',
  enabled => true,
}
```

## Usage

* ensure: set if the sar package will be installed or removed.
* enable: set if sar is enabled or disabled.

## Reference

Classes:
* sar: main class, install the module and configure it.

## Limitations

* Radhat and derivatives: releases 5 and 6.
* Ubuntu: 14
* Other: Not supported.
