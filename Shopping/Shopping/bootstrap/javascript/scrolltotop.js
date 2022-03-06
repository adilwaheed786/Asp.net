//< !--script for smooth scroll on lick on a tag-- >
    <script>
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();

                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            })};
        });
    </script>
    //<!--script for smooth scroll on lick on a tag-- >
