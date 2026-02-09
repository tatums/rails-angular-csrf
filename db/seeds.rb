posts = [
  { title: "Getting Started with Rails 7.1", body: "Rails 7.1 brings many exciting features including async queries, Dockerfile generation by default, and improved security features." },
  { title: "Angular 18 Standalone Components", body: "Angular 18 makes standalone components the default, simplifying application architecture and reducing the need for NgModules." },
  { title: "Understanding CSRF Protection", body: "Cross-Site Request Forgery (CSRF) is an attack that tricks a user into submitting a malicious request. CSRF tokens are the standard defense mechanism." },
  { title: "Full-Stack Development with Rails + Angular", body: "Combining Rails as a backend API with Angular on the frontend gives you the best of both worlds: Rails' convention-over-configuration and Angular's powerful component system." },
  { title: "Cookie-Based CSRF in SPAs", body: "Single Page Applications can use cookie-based CSRF tokens. The server sets an XSRF-TOKEN cookie, and the client sends it back as an X-XSRF-TOKEN header on mutating requests." }
]

posts.each do |attrs|
  Post.find_or_create_by!(title: attrs[:title]) do |post|
    post.body = attrs[:body]
  end
end

puts "Seeded #{Post.count} posts"
