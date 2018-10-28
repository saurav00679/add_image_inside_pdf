# AddImageInsidePdf - Replace any text with image in PDF files

This gem is very efficient for the case when we need to replace any text with image within the pdfs. This gem also allows to replace multiple texts with any image in single call.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'add_image_inside_pdf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install add_image_inside_pdf

## Usage

	# Replace single text with the image [ height should be a number ]
	AddImageInsidePdf.replace_text_by_image(pdf_file_path, 'string_to_replace', image_local_path, height)
	AddImageInsidePdf.replace_text_by_image("sample1.pdf", "IMAGE PLACEHOLDER", "image.jpg", 20)
	
	# Replace all required text with the image
	AddImageInsidePdf.replace_all_text_by_image(pdf_file_path, ['string1', 'string2'], image_local_path, height)
	AddImageInsidePdf.replace_all_text_by_image("sample2.pdf", ["image1", "image2", "image3"], "image.jpg", 20)

	# Height parameter is optional so if you will ignore height parameter then it will take 20 automatically
	AddImageInsidePdf.replace_text_by_image("sample3.pdf", "IMAGE PLACEHOLDER", "image.jpg")

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ashishprajapati/add_image_inside_pdf. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AddImageInsidePdf project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ashishprajapati/add_image_inside_pdf/blob/master/CODE_OF_CONDUCT.md).
