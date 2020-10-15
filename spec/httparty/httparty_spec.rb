describe 'HTTPaty' do
  it 'HTTParty' do
    # stub_request(:get, "http://jsonplaceholder.typicode.com/posts/2").
        #  to_return(status: 200, body: '', headers: {'content-type': 'application/json: Chaset etc..'})

    VCR.use_cassette("jsonplaceholder/posts") do
      response = HTTParty.get('http://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      p content_type
      expect(content_type).to match(%r{application\/json})
    end
  end
end
