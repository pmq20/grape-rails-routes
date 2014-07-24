# grape-rails-routes

After you mount Grape API routes into Rails, Grape API routes would normally not be printed in `rake routes` or `/rails/info/routes`.

This gem adds routes printing functionalities for Grape into Rails.

## Usage

Add this line to your `Gemfile`

```ruby
    gem 'grape-rails-routes'
```

Then review your routes via

```bash
    rake routes_with_grape
```

Or (recommended) access

```
http://localhost:3000/rails/info/routes_with_grape
```

to get a HTML table view of all your routes.

Enjoy :P
