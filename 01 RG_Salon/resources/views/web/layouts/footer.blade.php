<!-- Footer Top Section Start -->
<p class="copyright text-center">&copy; 2021 RG Salon.</p>
</div>
<!-- JS
============================================ -->

<!-- jQuery JS -->
<script src="{{asset('web/assets/js/vendor/jquery-1.12.4.min.js')}}"></script>
<!-- Popper JS -->
<script src="{{asset('web/assets/js/popper.min.js')}}"></script>
<!-- Bootstrap JS -->
<script src="{{asset('web/assets/js/bootstrap.min.js')}}"></script>
<!-- Plugins JS -->
<script src="{{asset('web/assets/js/plugins.js')}}"></script>
<script src="{{asset('web/assets/js/owl-carousel.js')}}"></script>
    <script src="{{asset('web/assets/js/scrollreveal.min.js')}}"></script>
<!-- Main JS -->
<script src="{{asset('web/assets/js/main.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.4.0/dropzone.js"></script>
@yield('scripts')
<script>
    $(function() {
        $('.alert').delay(1000).slideUp(500);
    });
</script>
</body>

</html>