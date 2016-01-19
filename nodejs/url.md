    url.parse(urlStr, [parseQueryString], [slashesDenoteHost])
    
第一个参数为url字符串，　第二个为布尔值，为true时，解析得到的对象成员query为一个json对象，默认为false，query此时为一个json字符串

    url.format(urlObj)

与上面个函数反向

在url解析中，空格、以及< > " ` \r \n \t { } | \ ^ '等字符会被转义

解析后的对象成员有

    'http://user:pass@host.com:8080/p/a/t/h?query=string#hash'
    
    href: The full URL that was originally parsed. Both the protocol and host are lowercased.
    Example: 'http://user:pass@host.com:8080/p/a/t/h?query=string#hash'
    
    protocol: The request protocol, lowercased.
    Example: 'http:'
    
    slashes: The protocol requires slashes after the colon.
    Example: true or false
    
    host: The full lowercased host portion of the URL, including port information.
    Example: 'host.com:8080'
    
    auth: The authentication information portion of a URL.
    Example: 'user:pass'
    
    hostname: Just the lowercased hostname portion of the host.
    Example: 'host.com'
    
    port: The port number portion of the host.
    Example: '8080'
    
    pathname: The path section of the URL, that comes after the host and before the query, including the initial slash if present. No decoding is performed.
    
    Example: '/p/a/t/h'
    search: The 'query string' portion of the URL, including the leading question mark.
    Example: '?query=string'
    
    path: Concatenation of pathname and search. No decoding is performed.
    Example: '/p/a/t/h?query=string'
    
    query: Either the 'params' portion of the query string, or a querystring-parsed object.
    Example: 'query=string' or {'query':'string'}
    
    hash: The 'fragment' portion of the URL including the pound-sign.
    Example: '#hash'