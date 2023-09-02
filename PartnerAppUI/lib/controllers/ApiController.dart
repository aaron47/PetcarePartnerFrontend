import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_patner_demo/models/reservation.dart';
import 'package:pet_patner_demo/models/service_model.dart';
import 'package:pet_patner_demo/network/remote/Requests/add_offering_user_request.dart';
import 'package:pet_patner_demo/network/remote/Requests/create_service_request.dart';
import '../models/pet.dart';
import '../models/response_helper.dart';
import '../models/service.dart';
import '../models/user.dart';
import '../network/remote/Requests/login_request.dart';
import '../network/remote/Requests/signup_request.dart';
import '../network/remote/Requests/create_pet_request.dart';
import '../network/services/ApiService.dart';

class ApiController extends GetxController {
  var isLoading = false.obs;
  var status = true.obs;
  var error = ''.obs;
  var user = User().obs;
  var pets = <Pet>[].obs;
  var services = <Service>[].obs;
  var servicesList = <ServiceModel>[].obs;
  var isLoadingServices = false.obs;
  var isLoadingAddService = true.obs;
  var statusAddService = true.obs;
  var errorAddService = ''.obs;
  var service = ServiceModel().obs;
  var reservations = <Reservation>[].obs;
  var isLoadingReservation = false.obs;
  var reservationAccepte = Reservation().obs;
  var isLoadingReservationAccepte = false.obs;
  var errorReservationAccepte = ''.obs;
  var reservationDecline = Reservation().obs;
  var isLoadingReservationDecline = false.obs;
  var errorReservationDecline = ''.obs;

  Future<ResponseHelper> loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      var loggedInUser = await ApiService.login(LoginRequest(
        email: email,
        password: password,
      ));
      user.value = loggedInUser;
    } catch (e) {
      error.value = 'Error logging in';
    }

    isLoading.value = false;

    if (user.value.email == null) {
      status.value = false;
      return ResponseHelper(status: false, isLoading: isLoading.value);
    }

    status.value = true;
    return ResponseHelper(status: true, isLoading: isLoading.value);
  }

  Future<ResponseHelper> signUpUser(
    String fullName,
    String email,
    String gender,
    String role,
    String phone,
    String imageLink,
    String address,
    String password,
  ) async {
    isLoading.value = true;
    try {
      var signUpRequest = new SignUpRequest(
          fullName: fullName,
          email: email,
          phone: phone,
          imageLink: imageLink,
          address: address,
          password: password,
          gender: gender,
          role: role);
      var signUpUser = await ApiService.signUp(signUpRequest);
      user.value = signUpUser;
    } catch (e) {
      error.value = 'Error signing up';
    } finally {
      isLoading.value = false;
    }

    if (user.value.email == null) {
      status.value = false;
      return ResponseHelper(status: false, isLoading: isLoading.value);
    }

    status.value = true;
    return ResponseHelper(status: true, isLoading: isLoading.value);
  }

  Future<bool> addPet(CreatePetRequest createPetRequest) async {
    isLoading.value = true;
    try {
      var pet = await ApiService.addPet(createPetRequest);
      pets.add(pet);
    } catch (e) {
      error.value = 'Error adding pet';
    } finally {
      isLoading.value = false;
    }

    return isLoading.value;
  }

  Future<void> fetchUserPets(String userEmail) async {
    isLoading.value = true;
    try {
      pets.clear();
      var userPets = await ApiService.findAllUserPets(userEmail);
      pets.addAll(userPets);
      print("Fetched pets: ${pets.length}");
    } catch (e) {
      error.value = 'Error fetching user pets: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUserServices(String userEmail) async {
    if (services.length > 0) {
      return;
    }
    isLoading.value = true;
    try {
      var userServices = await ApiService.findUserServices(userEmail);
      services.value = userServices;
    } catch (e) {
      error.value = 'Error fetching user services';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addOfferingUser(
      AddOfferingUserRequest addOfferingUserRequest) async {
    isLoading.value = true;
    try {
      var service = await ApiService.addOfferingUser(addOfferingUserRequest);
      services.add(service);
    } catch (e) {
      error.value = 'Error adding service';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchServices() async {
    isLoadingServices.value = true;
    try {
      var services = await ApiService.findAllServices();
      servicesList.value = services;
      inspect(servicesList);
    } catch (e) {
      error.value = 'Error fetching services';
    } finally {
      isLoadingServices.value = false;
    }
  }

  Future<ResponseHelper> addService(
    String email,
    String serviceName,
    String imageLink,
    String title,
    int price,
    String description,
    int duration,
  ) async {
    isLoading.value = true;
    try {
      var addServiceRequest = new CreateServiceRequest(
        description: description,
        duration: duration,
        userEmail: email,
        imageLink: imageLink,
        price: price,
        serviceName: serviceName,
        title: title,
      );
      var serviceResult = await ApiService.addService(addServiceRequest);
      service.value = serviceResult;
    } catch (e) {
      errorAddService.value = 'Error add service';
    } finally {
      isLoadingAddService.value = false;
    }

    if (service.value.id == null) {
      statusAddService.value = false;
      return ResponseHelper(
          status: false, isLoading: isLoadingAddService.value);
    }
    statusAddService.value = true;
    return ResponseHelper(status: true, isLoading: isLoadingAddService.value);
  }

  Future<void> fetchReservations() async {
    isLoadingReservation.value = true;
    reservations.clear();
    try {
      var reservationsResult = await ApiService.findAllReservations();
      for (var reservation in reservationsResult) {
        if (reservation.sitterId == user.value.id) {
          reservations.add(reservation);
        }
      }
      inspect(reservations);
    } catch (e) {
      error.value = 'Error fetching services';
    } finally {
      isLoadingReservation.value = false;
    }
  }

  Future<ResponseHelper> acceptRequest(String id) async {
    isLoadingReservationAccepte.value = true;
    try {
      
      var acceptResult = await ApiService.acceptRequest(id);
      print('>>>>$acceptResult');
      reservationAccepte.value = acceptResult;
    } catch (e) {
      errorReservationAccepte.value = 'Error accept reservation';
    } finally {
      isLoadingReservationAccepte.value = false;
    }

    if (reservationAccepte.value.id == null) {
      return ResponseHelper(
          status: false, isLoading: isLoadingReservationAccepte.value);
    }
    return ResponseHelper(status: true, isLoading: isLoadingReservationAccepte.value);
  }

   Future<ResponseHelper> declineRequest(String id) async {
    isLoadingReservationDecline.value = true;
    try {
      
      var declineResult = await ApiService.declineRequest(id);
      print('>>>>$declineResult');
      reservationDecline.value = declineResult;
    } catch (e) {
      errorReservationDecline.value = 'Error decline reservation';
    } finally {
      isLoadingReservationDecline.value = false;
    }

    if (reservationDecline.value.id == null) {
      return ResponseHelper(
          status: false, isLoading: isLoadingReservationDecline.value);
    }
    return ResponseHelper(status: true, isLoading: isLoadingReservationDecline.value);
  }

  // Add more methods as needed for other API requests
}
