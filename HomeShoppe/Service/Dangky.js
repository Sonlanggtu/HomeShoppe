var HomeController = {
    init: function () {
        HomeController.LoadData();
    },

       LoadData: function () {
           $.ajax({           
               url: '/dang-ky?UserName=data',
               type: 'Get',
               dataType: 'JSON',
               data: {               
                       UserName: txtUserName,
                       Password: txtPassword,
                       Email: txtEmail             
               },
               success: function () {

               }, 
               error: function () {

               }

           });
    }
};
HomeController.init();