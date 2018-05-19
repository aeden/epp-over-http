%%%

    Title = "EPP over HTTP"
    abbrev = "EPP over HTTP"
    category = "info"
    docName = "draft-regext-eden-epp-over-http-00"
    ipr= "trust200902"
    area = "General"
    workgroup = "regext"
    keyword = ["I-D", "Internet Draft"]

    date = 2018-05-18T00:00:00Z

    [[author]]
    initials="A."
    surname="Eden"
    fullname="Anthony Eden"
    organization = "DNSimple"
      [author.address]
      email = "anthony.eden@dnsimple.com"
      [author.address.postal]
      street = "2412 Irwin St"
      city = "Melbourne"
      code = "FL 32901"

%%%

.# Abstract

This document describes how an Extensible Provisioning Protocol (EPP) session is mapped onto a sequence of HTTP requests and responses. This mapping requires use of the Transport Layer Security (TLS) protocol to protect information exchanged between an EPP client and an EPP server.

{mainmatter}

# Introduction

## Background and Motivation

This document describes how the Extensible Provisioning Protocol (EPP) is mapped onto a sequence of HTTP requests and responses. Transport security is provided by the Transport Layer Security (TLS) Protocol [RFC2246].  EPP is described in [RFC5730].  HTTP/1.1 is described in [RFC2616].

[RFC5734] describes how to map EPP onto stateful TCP connections. Since the publication of that document, HTTP has gained wide adoption for transporting a wide variety of application data. HTTP provides several advantages over direct TCP for transporting data, including a wide variety of off-the-shelf server implementations, standards for authentication, proxy support, etc. Furthermore, HTTP provides a simpler mechanism for scaling due to its stateless nature.

## Terminology

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 [RFC2119].

# Session Management

As HTTP is a stateless protocol, each HTTP request must contain all of the information necessary to establish the identity of the EPP client. The EPP `<login>` and `<logout>` commands are not applicable when using HTTP as the transport protocol, rather authentication
credentials MUST be sent on each request using standard HTTP authentication mechanisms.

The EPP `<login>` command is mapped to HTTP headers as follows:

    Authorization: Basic Q2xpZW50WDpGT08tYmFyMg==
    Content-Language: en
    X-EPP-Version: 1.0
    X-EPP-Service: urn:ietf:params:xml:ns:obj1
    X-EPP-Service: urn:ietf:params:xml:ns:obj2
    X-EPP-Service: urn:ietf:params:xml:ns:obj3
    X-EPP-Service-Ext: http://custom/obj1ext-1.0

# Message Exchange

HTTP servers that support EPP over HTTP must support HTTP requests with a single EPP frame. Servers MAY support multipart messages.

When the body of the HTTP request contains a single EPP frame, the content type of the HTTP message MUST be "application/epp+xml".

When a multipart body is used, the body content type MUST be "multipart/mixed" and MUST define the boundry. Each part MUST contain a single EPP frame and the content type of each part MUST be "application/epp+xml". In multipart messages, each part MUST be processed in the order it appears in the multipart body.

When a server receives an HTTP request with a single frame, the HTTP response content type MUST be "application/epp+xml".

When a server receives a multipart HTTP request, the HTTP response content type MUST be "multipart/mixed" and MUST define the boundry. The content type for each part of the multipart response MUST be "application/epp+xml".

When a client receives a multipart HTTP response, the client MUST process each part in the order it appears in the multipart body.

EPP errors MUST be returned as part of the EPP response XML, not as HTTP error codes. HTTP error codes are reserved for HTTP errors only.

# Security Considerations

TBD

# Privacy Considerations

There are no additional privacy concerns introduced by this document.

# IANA Considerations

There are no additional IANA considerations introduced by this document.

{backmatter}

# Acknowledgements
