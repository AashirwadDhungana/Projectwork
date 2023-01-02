@extends('web.layouts.app')


@section('content')

<!-- About Section Start -->
<div class="about-section section position-relative pt-50 pb-60 pt-lg-50 pb-lg-50 pt-md-50 pb-md-40 pt-sm-50 pb-sm-30 pt-xs-50 pb-xs-20 fix">

    <!-- About Section Shape -->
    <div class="about-shape one rellax" data-rellax-speed="-5" data-rellax-percentage="0.5"><img src="{{asset('web/assets/images/shape/about-shape-1.png')}}" alt=""></div>
    <div class="about-shape two rellax" data-rellax-speed="3" data-rellax-percentage="0.5"><img src="{{asset('web/assets/images/shape/about-shape-2.png')}}" alt=""></div>

    <div class="container">
        <div class="row align-items-center">

            <!-- About Image Start -->
           <!-- About Image End -->

            <!-- About Content Start -->
            <div class="col-lg-6 col-12 mr-auto order-2 order-lg-1 mb-30">
                <div class="about-content about-content-1">
                    <h3>Provide the best</h3>
                    <h1>RG Salon</h1>
                    <div class="desc">
                        <p>We provide the best product all over the Nepal. We are the world best store for thrift products. You can buy our product without any hesitation because we always concern about our product quality and always maintain it properly.<p>The plan for initiating the Salon was started before the pandemic occured, but due to unforseen circumstances we continue with our plan after the pandemic has slowed down.</p>
                    Starting from May we will be available with our products online in the store as well.</p>
                    </div>
                   
                </div>
            </div><!-- About Content End -->
            <div class="col-lg-6 col-12 mr-auto order-2 order-lg-1 mb-30">
            <img src="{{asset('web/assets/images/slider-icon.png')}}"
            </div>

        </div>
    </div>

</div><!-- About Section End -->
<!-- ***** Features Big Item Start ***** -->
<section class="section" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12 col-sm-12" data-scroll-reveal="enter left move 30px over 0.6s after 0.4s">
<img src="{{asset('web/assets/images/left-image.png')}}" class="rounded img-fluid d-block mx-auto" alt="App">
                </div>
                <div class="right-text col-lg-5 col-md-12 col-sm-12 mobile-top-fix">
                    <div class="left-heading">
                        <h5>About RG Salon</h5>
                    </div>
                    <div class="left-text">
                        <p>As a hair salon we are available for you guys after <a href="#">Covid-19.</a> As a start up plan we are only available in Kathmandu Valley. <br><br>
                        The plan for initiating the Salon was started before the pandemic occured, but due to unforseen circumstances we continue with our plan after the pandemic has slowed down.
                    Starting from May we will be available with our products online in the store as well.</p>
                        <a href="#about2" class="main-button">Discover More</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="hr"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Features Big Item End ***** -->


    <!-- ***** Features Big Item Start ***** -->
    <section class="section" id="about2">
        <div class="container">
            <div class="row">
                <div class="left-text col-lg-5 col-md-12 col-sm-12 mobile-bottom-fix">
                    <div class="left-heading">
                        <h5>What makes us better than other Hair Salon's?</h5>
                    </div>
                    <p>RG salon provides you the best customer experience that a hair salon can provide.</p>
                    <ul>
                        <li>
                            <img src="{{asset('web/assets/images/about-icon-01.png')}}" alt="">
                            <div class="text">
                                <h6>Time Value</h6>
                                <p>We value the time that our customer has seperated for our service throughout thier busy schedule.
                                </p>
                            </div>
                        </li>
                        <li>
                            <img src="{{asset('web/assets/images/about-icon-02.png')}}" alt="">
                            <div class="text">
                                <h6>Exotic Rewards</h6>
                                <p>Various gift hampers are awarded to our regular customers, the more the merrier. </p>
                            </div>
                        </li>
                        <li>
                            <img src="{{asset('web/assets/images/about-icon-03.png')}}" alt="">
                            <div class="text">
                                <h6>Sanitation</h6>
                                <p>As of the pandemic we try to be as clean as possible. if you have any queries <a rel="nofollow" href="https://gmail.com">contact us </a>on RG Salon.</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="right-image col-lg-7 col-md-12 col-sm-12 mobile-bottom-fix-big" data-scroll-reveal="enter right move 30px over 0.6s after 0.4s">
                    <img src="{{asset('web/assets/images/right-image.png')}}" class="rounded img-fluid d-block mx-auto" alt="App">
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Features Big Item End ***** -->


    
    <!-- ***** Covid 19 Protocol Start ***** -->
    <section class="section" id="Covid-19">
        <div class="container">
            <!-- ***** Covid 19 Title Start ***** -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>Covid-19 Protocol's</h2>
                    </div>
                </div>
                <div class="offset-lg-3 col-lg-6">
                    <div class="section-heading">
                        <p>Due to pandemic we have certain procedure and rules applied to our Hair Salon.</p><br>
                    </div>
                </div>
            </div>
            <!-- ***** COvid 19 title End ***** -->

            <div class="row">
                <div class="left-text col-lg-6 col-md-6 col-sm-12">
                    <h5>Less with people more with sanitization</h5><br>
                    <div class="accordion-text">
                        <p align="justify">The spreading of new virus has led us to follow some new rules and regulations. The less the people the more we can be safe. As our customer we value your health and the health of our stylsit's as well.</p>
                        <p>At this day and time we dont want any of our customers and stylist to suffer form the virus so we have only two 4 of the stylists available at our hair salon.</p>
                        <span>Email: <a href="#">rgsalon@hotmail.com</a><br><br></span>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="accordions is-first-expanded">
                        <article class="accordion">
                            <div class="accordion-head">
                                <span>Our Part:</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <ul>
                                        <li class="circle">
                                        Employees will be monitoring their temperatures daily before work and continuously monitoring for symptoms of COVID-19.<br></li>
                                        <li class="circle">
                                        Employees will go home and follow all CDC guidelines in the event someone develops symptoms including self-isolation and contact notification.<br>
                                        </li>
                                        <li class="circle">
                                        If this occurs, we will be required to re-schedule your appointment.<br>
                                        </li>
                                        <li class="circle">
                                        We do apologize in advance if this happens, but hope you understand it’s for the safety and health of our employees and customers.<br>
                                        </li>    
                                        <li class="circle">Our stations and shampoo bowls will be 6 feet apart to ensure social distancing guidelines .<br></li>
                                        <li class="circle">
                                        All tools, stations, chairs, shampoo bowls, dryers or any other contact surfaces will be disinfected with an EPA and State-board approved disinfectant. Employees are prohibited from entering other work stations while a client is present.
                                        </li>
                                        <li class="circle">
                                        A pause will be placed on serving beverages and treats in salon at this time. But no worries! You can bring your favorite drinks to enjoy while receiving your service! 
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </article>
                        <article class="accordion">
                            <div class="accordion-head">
                                <span>Your Part</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <ul>
                                        <li class="circle">We will be requiring all clients to wear a mask within the salon. This is part of our opening guidelines. Disposable masks will be available for $1 each. Have your own Mask? No problem! Please note that color may get on your mask if you choose to wear your own. 😷</li>
                                        <li class="circle" >DO NOT bring children or other people with you to your appointments. If you are bringing another person with you who IS receiving services from another stylist, we ask that neither of you stay past the duration of your personal appointment. But don’t worry! Excelsior is beautiful this time of year and you can check out all it has to offer! If your child is under 10 years old and you need to be with them during their appointment, we will do our best to accommodate one parent to be present.
                                             No other siblings/ friends will be allowed in the salon. Children must also wear masks.</li>
                                        <li class="circle">
                                            Please reschedule your appointment if you or ANY member of your household has had a fever within the last 24 hours. If a client comes in sick, we will be asking that client to reschedule the appointment until a later, safer date. 
                                        </li>
                                        <li class="circle">
                                            Coming sick is NOT an option, services will be rescheduled immediately until after you are well.  If you or ANY person you have come in contact with has had Coronavirus, please wait to reschedule your appointment until AFTER your 14-day quarantine is complete.
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </article>    
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!-- Contact  -->
     

@include('web.product-section')
<!-- **** Contact us **** -->
<section class="section" id="contact-us">
        <div class="container">
            <div class="section-heading">
                <h2>Contact Us<br></h2>
            </div>  
            <div class="row">
                
                <div class="con-item mx-auto"><P>Kamalbinayak<br>Bhaktapur,Province-3<br>Nepal</P></div>
                <div class="con-item mx-auto"><P>Call Now<br>Cellphone No.<br>9841234512</P></div>
                <div class="con-item mx-auto"><P>COVID-19 Hours<br>Sun-Fri:12pm-8pm<br>Sat:Closed</P></div>
                
                    <!-- <h6 class="service-title"><P>Kamalbinayak<br>Bhaktapur,Province-3<br>Nepal</P></h6> -->
              
            </div>
        </div>
    </section>





@endsection