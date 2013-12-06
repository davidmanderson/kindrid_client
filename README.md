# KindridClient

A Ruby wrapper around the Kindrid API that lets you lookup donations and donors.

## Installation

Add this line to your application's Gemfile:

    gem 'kindrid_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kindrid_client

## Usage

To set up the gem, add keys:

    KindridClient.key = "key"
    KindridClient.secret = "secret"


Now you may run the following commands:

Donations


    KindridClient.donations             # optional limit and offset params (ex: {limit: 15, offset: 2})
    KindridClient.donations(donor_id)   # optional limit and offset params (ex: {limit: 15, offset: 2})

KindridClient.donation(donation_id)

Donors

    KindridClient.donors                # optional limit and offset params (ex: {limit: 15, offset: 2})

    KindridClient.donor(donor_id)
  
Also, to consume requests from Kindrid and validate the HMAC with your secret key, use the following:

    KindridClient.consume(request)


For more information about the Kindrid API, you can view their api documentation here: http://kindrid.com/dashboard/settings/api/docs

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
