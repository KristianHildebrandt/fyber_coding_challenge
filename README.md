# Fyber coding challenge
see the result here: `http://46.101.217.204/`

In order to start the project locally make sure to set the API_KEY variable to your Fyber api key. This project uses [.env](https://github.com/bkeepers/dotenv) but you can also just pass it directly starting the rails server:

`API_KEY=your_api_key rails s`

# Technical Decisions

## Choosing Rails as the Framework
Rails is still my framework of choice and I believe its its a very good fit for many general use cases. Ruby as well as Rails have traditionally been not very well suited when it comes to projects where scalability is critical, since ruby is relatively slow by nature and the support for concurrency was very poor. With the removal of Rack::Lock and threaded servers such as Puma or Thin, performance in terms of concurrency has improved. Parallel execution (at least for MRI) are still problematic. In term of more modern approaches such as the micro services architecture, rails is probably too bloated and slow. There it makes more sence to use smaller and faster Frameworks.

For the fyber coding challenge, I used Rails, because view layer was needed. I have seen quite some instances where people chose a framework like Sinatra and ended up doing many things that Rails provides by default: using complex models or controllers for instance. This obviosly defeats the reason of using a minimalistic framework, especially if you end up writing code for trivial things.

I also chose to use (Thoughtbot's suspenders gem)[https://github.com/thoughtbot/suspenders], which in my opionion is a very good out-of-the box template. I like using templates since it annoys me to just setup all the things I need: Rspec, Guard, Shoulda, Spring, CSS-Frameworks ect. I have also never tried the Bourbon CSS-Framework, and thought it would be a cool occasion to try it out.

In generall though, this project depends on an external API and thus and if performance is critical (which it probably is most of the time) it makes more sence to use a tech stack that provides better concurrency out of the box: Go, Scala and Erlang would be good choices. For Rubyists, Jose Valims (Elixir language)[http://elixir-lang.org/] is up-and-coming and might me a good choice if you come from a Ruby/Rails background and need concurrency.

## Design Decisions
### Running the requests synchronously
As I just explained, concurrency is not one of Ruby's strengths. External requests should also always happen asynchronously. For now, I did them synchronously. Since you can basically put a load balancer in front of the app and just scale up the number of apps, I would consider this solution ok for now (at least in the scope of the challenge). There are however several improvements that could be made in the following steps:

- run the request asynchronously using a work-queue, and just use long-polling (not very elegant) to update the page or just tell the user to refresh the page until the result is there
- cache the response with memcached or redis (could lead to outdated results as well as to one of the hardest questions in cs: which is when to invalidate the cache?)
- run the request async (Sidekiq i.e.), then use another service (i.e. NodeJS) that maintains socket connections to our users, which are then notified when the job is done (the challenge though exlicitely stated to use ruby though)

### Extracting the gem
In order to call the Fyber API, I created a Gem (check ./gems) which handles the api stuff. This something I like to to quite often: extract logic into their own useful, encapsulated libraries and keep models, controllers and views clean. There is really no reason to couple an external api wrapper the application logic. I also like this approach since tests are fasts.
