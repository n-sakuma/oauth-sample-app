class NextCoreClient

  NEXTCORE_HOSTNAME=""
  API_KEY=""
  API_SIG=""

  def initialize(url, params={})
    @url = URI.parse(url)
    @parameter = set_query(params)
    @api_sig = generate_signature
  end

  def get
    #...
  end

  private

  def set_query(params)
    q = "#{@url.query}&timestamp=#{Time.now.to_i}"
    splited_query = Rack::Utils.parse_query(q).merge(params)  # クエリー文字列をハッシュに変換
    sorted_query = splited_query.sort{|a, b| a[0] <=> b[0]}.  # キーをA-Za-zの順にソート
      map{|query_pair| query_pair.join('=')}.join('&')
    URI.escape("#{sorted_query}&api_key=#{API_KEY}")
  end

  def generate_signature
    http_method = "GET"
    hostname = NEXTCORE_HOSTNAME
    request_path = @url.path
    request_parameter = @parameter
    sig_body = [http_method, hostname, request_path, request_parameter].join("\n")
    hash = OpenSSL::HMAC.digest('sha256', API_SIG, sig_body)
    Base64.encode64(hash).gsub(/=/, '')
  end

end
