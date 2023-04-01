import 'dart:core';
import 'dart:html';

class User {
  String id = "";

  String lastName = "";
  String firstName = "";
  String email = "";

  String birthDate = "";
  String adress = "";
  int cin = 0;
  int phoneNumber1 = 0;
  int phoneNumber2 = 0;
  String image = "";
  String password = "";
  int nbConge = 0;

  String role = "";
  String situation = "";
  String sexe = "";
  int nbEnfants = 0;

  String startTime = " ";

  String endTime = "";
  String resetToken = "";
  String resetTokenExpiration = "";
  User(
      String lastName,
      String firstName,
      String email,
      String birthDate,
      String adress,
      int cin,
      int PhoneNumber1,
      int PhoneNumber2,
      String image,
      int nbConge,
      String role,
      String situation,
      String sexe,
      int nbEnfants,
      String startTime,
      String endTime) {
    this.lastName = lastName;
    this.firstName = firstName;
    this.email = email;
    this.birthDate = birthDate;
    this.adress = adress;
    this.cin = cin;
    this.phoneNumber1 = PhoneNumber1;
    this.phoneNumber2 = phoneNumber2;
    this.image = image;
    this.nbConge = nbConge;
    this.role = role;
    this.situation = situation;
    this.sexe = sexe;
    this.nbEnfants = nbEnfants;
    this.startTime = startTime;
    this.endTime = endTime;
  }

  String getEndTime() {
    return endTime;
  }

  setEndTime(String endTime) {
    this.endTime = endTime;
  }

  String getRole() {
    return role;
  }

  setRole(String role) {
    this.role = role;
  }

  String getStartTime() {
    return startTime;
  }

  setStartTime(String startTime) {
    this.startTime = startTime;
  }

  String getSexe() {
    return sexe;
  }

  setSexe(String sexe) {
    this.sexe = sexe;
  }

  String getId() {
    return id;
  }

  setId(String id) {
    this.id = id;
  }

  String getBirthDate() {
    return birthDate;
  }

  setBirthDate(String birthDate) {
    this.birthDate = birthDate;
  }

  int getCin() {
    return cin;
  }

  void setCin(int cin) {
    this.cin = cin;
  }

  int getPhoneNumber1() {
    return phoneNumber1;
  }

  setPhoneNumber1(int phoneNumber1) {
    this.phoneNumber1 = phoneNumber1;
  }

  int getPhoneNumber2() {
    return phoneNumber2;
  }

  setPhoneNumber2(int phoneNumber2) {
    this.phoneNumber2 = phoneNumber2;
  }

  String getImage() {
    return image;
  }

  setImage(String image) {
    this.image = image;
  }

  int getNbConge() {
    return nbConge;
  }

  setNbConge(int nbConge) {
    this.nbConge = nbConge;
  }

  String getSituation() {
    return situation;
  }

  setSituation(String situation) {
    this.situation = situation;
  }

  int getNbEnfants() {
    return nbEnfants;
  }

  setNbEnfants(int nbEnfants) {
    this.nbEnfants = nbEnfants;
  }

  String getResetToken() {
    return resetToken;
  }

  setResetToken(String resetToken) {
    this.resetToken = resetToken;
  }

  String getResetTokenExpiration() {
    return resetTokenExpiration;
  }

  String getLastName() {
    return lastName;
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

  String getFirstName() {
    return firstName;
  }

  setFirstName(String firstName) {
    this.firstName = firstName;
  }

  String getEmail() {
    return email;
  }

  setEmail(String email) {
    this.email = email;
  }

  String getAdress() {
    return adress;
  }

  setAdress(String adress) {
    this.adress = adress;
  }

  setPassword(String password) {
    this.password = password;
  }

  String getPassword() {
    return password;
  }

  String getUsername() {
    return email;
  }
}
