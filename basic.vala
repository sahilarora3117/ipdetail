void main () {
    var uri = "https://ipinfo.io/json";

    var session = new Soup.Session ();
    var message = new Soup.Message ("GET", uri);
    session.send_message (message);

    try {
        var parser = new Json.Parser ();
        parser.load_from_data ((string) message.response_body.flatten ().data, -1);
         var root_object = parser.get_root ().get_object ();
         string city = root_object.get_string_member ("city");
        
        stdout.printf( city);
        
    } catch (Error e) {
        stderr.printf ("I guess something is not working...\n");
    }
}
