<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <meta charset="utf-8">
    <title>Payment Gateway Platform</title>

    <script type="text/javascript">

        var tokenRequest = function () {
            //payment_method
            var args = {
                sellerId: "901348953",
                publishableKey: "0ED4187A-054C-48F5-B29D-F3AB8D75BE28",
                ccNo: "4000000000000002",
                cvv: "123",
                expMonth: $("#expMonth").val(),
                expYear: $("#expYear").val()
            };
            return TCO.requestToken(successCallback, errorCallback, args);
        };

        $(function () {

            TCO.loadPubKey('sandbox');

            $("#checkoutForm").submit(function (e) {
                tokenRequest();

                return false;
            });
        });

        // Called when token created successfully.
        var successCallback = function (data) {
            alert('Success callback called');
            var myForm = document.getElementById('checkoutForm');
            myForm.token.value = data.response.token.token;
            $("#token").val(data.response.token.token);
            myForm.submit();
        };

        // Called when token creation fails.
        var errorCallback = function (data) {
            // Retry the token request if ajax call fails
            if (data.errorCode === 200) {
                tokenRequest();
            } else {
                alert(data.errorMsg);
            }

        };
    </script>
</head>
<body>

<form class="form" id="checkoutForm" name="checkoutForm" action="CheckoutServlet" onsubmit="tokenRequest()"
      method="POST">
    <input type="hidden" name="EC_Type" value="EC-Mark"/>
    <div class="row-fluid">
        <div class="span6 inner-span">
            <br/>
            <label>Merchant</label>
            <select id="Merchant" name="merchant">
                <option value="1">CFL Exporters</option>
                <option value="2">Veegaland</option>
                <option value="3">BCT</option>
            </select>
            <br/>
            <br/>
            <label>Amount:</label>
            <input type="text" value="2.45" name="auth_amount" id="auth_amount">
            <p class="lead">Shipping Address</p>
            <table>
                <tr>
                    <td width="30%">Name</td>
                    <td><input type="text" name="recipient_name" value="Alegra Velava"></input></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="line1" value="55 East 52nd Street"></input></td>
                </tr>
                <tr>
                    <td>Address 1</td>
                    <td><input type="text" name="line2" value="21st Floor"></input></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" name="city" value="New York"></input></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><input type="text" name="state" value="NY"></input></td>
                </tr>
                <tr>
                    <td>Postal Code:</td>
                    <td><input type="text" name="postal_code" value="10022"></input></td>
                </tr>
                <input type="hidden" name="currencyCodeType"
                       value=<%=request.getParameter("currencyCodeType2")%>></input>
                <tr>
                    <td>Country</td>
                    <td>
                        <select id="PAYMENTREQUEST_0_SHIPTOZIP" name="country_code">
                            <option value="AF">Afghanistan</option>
                            <option value="AX">Åland Islands</option>
                            <option value="AL">Albania</option>
                            <option value="DZ">Algeria</option>
                            <option value="AS">American Samoa</option>
                            <option value="AD">Andorra</option>
                            <option value="AO">Angola</option>
                            <option value="AI">Anguilla</option>
                            <option value="AQ">Antarctica</option>
                            <option value="AG">Antigua and Barbuda</option>
                            <option value="AR">Argentina</option>
                            <option value="AM">Armenia</option>
                            <option value="AW">Aruba</option>
                            <option value="AU">Australia</option>
                            <option value="AT">Austria</option>
                            <option value="AZ">Azerbaijan</option>
                            <option value="BS">Bahamas</option>
                            <option value="BH">Bahrain</option>
                            <option value="BD">Bangladesh</option>
                            <option value="BB">Barbados</option>
                            <option value="BY">Belarus</option>
                            <option value="BE">Belgium</option>
                            <option value="BZ">Belize</option>
                            <option value="BJ">Benin</option>
                            <option value="BM">Bermuda</option>
                            <option value="BT">Bhutan</option>
                            <option value="BO">Bolivia</option>
                            <option value="BA">Bosnia and Herzegovina</option>
                            <option value="BW">Botswana</option>
                            <option value="BV">Bouvet Island</option>
                            <option value="BR">Brazil</option>
                            <option value="IO">British Indian Ocean Territory</option>
                            <option value="BN">Brunei Darussalam</option>
                            <option value="BG">Bulgaria</option>
                            <option value="BF">Burkina Faso</option>
                            <option value="BI">Burundi</option>
                            <option value="KH">Cambodia</option>
                            <option value="CM">Cameroon</option>
                            <option value="CA">Canada</option>
                            <option value="CV">Cape Verde</option>
                            <option value="KY">Cayman Islands</option>
                            <option value="CF">Central African Republic</option>
                            <option value="TD">Chad</option>
                            <option value="CL">Chile</option>
                            <option value="CN">China</option>
                            <option value="CX">Christmas Island</option>
                            <option value="CC">Cocos (Keeling) Islands</option>
                            <option value="CO">Colombia</option>
                            <option value="KM">Comoros</option>
                            <option value="CG">Congo</option>
                            <option value="CD">Congo, The Democratic Republic of The</option>
                            <option value="CK">Cook Islands</option>
                            <option value="CR">Costa Rica</option>
                            <option value="CI">Cote D'ivoire</option>
                            <option value="HR">Croatia</option>
                            <option value="CU">Cuba</option>
                            <option value="CY">Cyprus</option>
                            <option value="CZ">Czech Republic</option>
                            <option value="DK">Denmark</option>
                            <option value="DJ">Djibouti</option>
                            <option value="DM">Dominica</option>
                            <option value="DO">Dominican Republic</option>
                            <option value="EC">Ecuador</option>
                            <option value="EG">Egypt</option>
                            <option value="SV">El Salvador</option>
                            <option value="GQ">Equatorial Guinea</option>
                            <option value="ER">Eritrea</option>
                            <option value="EE">Estonia</option>
                            <option value="ET">Ethiopia</option>
                            <option value="FK">Falkland Islands (Malvinas)</option>
                            <option value="FO">Faroe Islands</option>
                            <option value="FJ">Fiji</option>
                            <option value="FI">Finland</option>
                            <option value="FR">France</option>
                            <option value="GF">French Guiana</option>
                            <option value="PF">French Polynesia</option>
                            <option value="TF">French Southern Territories</option>
                            <option value="GA">Gabon</option>
                            <option value="GM">Gambia</option>
                            <option value="GE">Georgia</option>
                            <option value="DE">Germany</option>
                            <option value="GH">Ghana</option>
                            <option value="GI">Gibraltar</option>
                            <option value="GR">Greece</option>
                            <option value="GL">Greenland</option>
                            <option value="GD">Grenada</option>
                            <option value="GP">Guadeloupe</option>
                            <option value="GU">Guam</option>
                            <option value="GT">Guatemala</option>
                            <option value="GG">Guernsey</option>
                            <option value="GN">Guinea</option>
                            <option value="GW">Guinea-bissau</option>
                            <option value="GY">Guyana</option>
                            <option value="HT">Haiti</option>
                            <option value="HM">Heard Island and Mcdonald Islands</option>
                            <option value="VA">Holy See (Vatican City State)</option>
                            <option value="HN">Honduras</option>
                            <option value="HK">Hong Kong</option>
                            <option value="HU">Hungary</option>
                            <option value="IS">Iceland</option>
                            <option value="IN">India</option>
                            <option value="ID">Indonesia</option>
                            <option value="IR">Iran, Islamic Republic of</option>
                            <option value="IQ">Iraq</option>
                            <option value="IE">Ireland</option>
                            <option value="IM">Isle of Man</option>
                            <option value="IL">Israel</option>
                            <option value="IT">Italy</option>
                            <option value="JM">Jamaica</option>
                            <option value="JP">Japan</option>
                            <option value="JE">Jersey</option>
                            <option value="JO">Jordan</option>
                            <option value="KZ">Kazakhstan</option>
                            <option value="KE">Kenya</option>
                            <option value="KI">Kiribati</option>
                            <option value="KP">Korea, Democratic People's Republic of</option>
                            <option value="KR">Korea, Republic of</option>
                            <option value="KW">Kuwait</option>
                            <option value="KG">Kyrgyzstan</option>
                            <option value="LA">Lao People's Democratic Republic</option>
                            <option value="LV">Latvia</option>
                            <option value="LB">Lebanon</option>
                            <option value="LS">Lesotho</option>
                            <option value="LR">Liberia</option>
                            <option value="LY">Libyan Arab Jamahiriya</option>
                            <option value="LI">Liechtenstein</option>
                            <option value="LT">Lithuania</option>
                            <option value="LU">Luxembourg</option>
                            <option value="MO">Macao</option>
                            <option value="MK">Macedonia, The Former Yugoslav Republic of</option>
                            <option value="MG">Madagascar</option>
                            <option value="MW">Malawi</option>
                            <option value="MY">Malaysia</option>
                            <option value="MV">Maldives</option>
                            <option value="ML">Mali</option>
                            <option value="MT">Malta</option>
                            <option value="MH">Marshall Islands</option>
                            <option value="MQ">Martinique</option>
                            <option value="MR">Mauritania</option>
                            <option value="MU">Mauritius</option>
                            <option value="YT">Mayotte</option>
                            <option value="MX">Mexico</option>
                            <option value="FM">Micronesia, Federated States of</option>
                            <option value="MD">Moldova, Republic of</option>
                            <option value="MC">Monaco</option>
                            <option value="MN">Mongolia</option>
                            <option value="ME">Montenegro</option>
                            <option value="MS">Montserrat</option>
                            <option value="MA">Morocco</option>
                            <option value="MZ">Mozambique</option>
                            <option value="MM">Myanmar</option>
                            <option value="NA">Namibia</option>
                            <option value="NR">Nauru</option>
                            <option value="NP">Nepal</option>
                            <option value="NL">Netherlands</option>
                            <option value="AN">Netherlands Antilles</option>
                            <option value="NC">New Caledonia</option>
                            <option value="NZ">New Zealand</option>
                            <option value="NI">Nicaragua</option>
                            <option value="NE">Niger</option>
                            <option value="NG">Nigeria</option>
                            <option value="NU">Niue</option>
                            <option value="NF">Norfolk Island</option>
                            <option value="MP">Northern Mariana Islands</option>
                            <option value="NO">Norway</option>
                            <option value="OM">Oman</option>
                            <option value="PK">Pakistan</option>
                            <option value="PW">Palau</option>
                            <option value="PS">Palestinian Territory, Occupied</option>
                            <option value="PA">Panama</option>
                            <option value="PG">Papua New Guinea</option>
                            <option value="PY">Paraguay</option>
                            <option value="PE">Peru</option>
                            <option value="PH">Philippines</option>
                            <option value="PN">Pitcairn</option>
                            <option value="PL">Poland</option>
                            <option value="PT">Portugal</option>
                            <option value="PR">Puerto Rico</option>
                            <option value="QA">Qatar</option>
                            <option value="RE">Reunion</option>
                            <option value="RO">Romania</option>
                            <option value="RU">Russian Federation</option>
                            <option value="RW">Rwanda</option>
                            <option value="SH">Saint Helena</option>
                            <option value="KN">Saint Kitts and Nevis</option>
                            <option value="LC">Saint Lucia</option>
                            <option value="PM">Saint Pierre and Miquelon</option>
                            <option value="VC">Saint Vincent and The Grenadines</option>
                            <option value="WS">Samoa</option>
                            <option value="SM">San Marino</option>
                            <option value="ST">Sao Tome and Principe</option>
                            <option value="SA">Saudi Arabia</option>
                            <option value="SN">Senegal</option>
                            <option value="RS">Serbia</option>
                            <option value="SC">Seychelles</option>
                            <option value="SL">Sierra Leone</option>
                            <option value="SG">Singapore</option>
                            <option value="SK">Slovakia</option>
                            <option value="SI">Slovenia</option>
                            <option value="SB">Solomon Islands</option>
                            <option value="SO">Somalia</option>
                            <option value="ZA">South Africa</option>
                            <option value="GS">South Georgia and The South Sandwich Islands</option>
                            <option value="ES">Spain</option>
                            <option value="LK">Sri Lanka</option>
                            <option value="SD">Sudan</option>
                            <option value="SR">Suriname</option>
                            <option value="SJ">Svalbard and Jan Mayen</option>
                            <option value="SZ">Swaziland</option>
                            <option value="SE">Sweden</option>
                            <option value="CH">Switzerland</option>
                            <option value="SY">Syrian Arab Republic</option>
                            <option value="TW">Taiwan, Province of China</option>
                            <option value="TJ">Tajikistan</option>
                            <option value="TZ">Tanzania, United Republic of</option>
                            <option value="TH">Thailand</option>
                            <option value="TL">Timor-leste</option>
                            <option value="TG">Togo</option>
                            <option value="TK">Tokelau</option>
                            <option value="TO">Tonga</option>
                            <option value="TT">Trinidad and Tobago</option>
                            <option value="TN">Tunisia</option>
                            <option value="TR">Turkey</option>
                            <option value="TM">Turkmenistan</option>
                            <option value="TC">Turks and Caicos Islands</option>
                            <option value="TV">Tuvalu</option>
                            <option value="UG">Uganda</option>
                            <option value="UA">Ukraine</option>
                            <option value="AE">United Arab Emirates</option>
                            <option value="GB">United Kingdom</option>
                            <option selected value="US">United States</option>
                            <option value="UM">United States Minor Outlying Islands</option>
                            <option value="UY">Uruguay</option>
                            <option value="UZ">Uzbekistan</option>
                            <option value="VU">Vanuatu</option>
                            <option value="VE">Venezuela</option>
                            <option value="VN">Viet Nam</option>
                            <option value="VG">Virgin Islands, British</option>
                            <option value="VI">Virgin Islands, U.S.</option>
                            <option value="WF">Wallis and Futuna</option>
                            <option value="EH">Western Sahara</option>
                            <option value="YE">Yemen</option>
                            <option value="ZM">Zambia</option>
                            <option value="ZW">Zimbabwe</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Telephone:</td>
                    <td><input type="text" name="phoneno" value="" maxlength="12"></input></td>
                </tr>


                <tr>
                    <td colspan="2"><p class="lead">Payment Methods:</p></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input checked id="paypal_payment_option" value="paypal_express" type="radio"
                               name="payment_method" title="PayPal Express Check out" class="radio"
                               onchange="changeStatus()">
                        &nbsp;Pay Pal


                        <div id="paypal-button"></div>


                    </td>


                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        <input id="token" name="token" type="hidden">
                        <input readonly="" id="p_method_2Checkout" value="2checkout" type="radio"
                               name="payment_method" title="2Checkout" class="radio" onchange="changeStatus()">&nbsp;2Checkout
                    </td>
                    <td>
                        <div id="CC_form" hidden="true">
                            <p>


                            <div>
                                <label>
                                    <span>Card Number</span>
                                    <input id="ccNo" type="text" value="4000000000000002" autocomplete="off"
                                           name="ccNo"/>
                                </label>
                            </div>
                            <div>
                                <label>
                                    <span>Expiration Date (MM/YYYY)</span>
                                    <input id="expMonth" type="text" size="2" value="12" name="expMonth"/>
                                </label>
                                <span> / </span>
                                <input id="expYear" type="text" size="4" value="2020" name="expYear"/>
                            </div>
                            <div>
                                <label>
                                    <span>CVC</span>
                                    <input id="cvv" type="text" autocomplete="off" value="123" name="cvv"/>
                                </label>
                            </div>

                            <script type="text/javascript"
                                    src="https://www.2checkout.com/checkout/api/2co.min.js"></script>


                            </p>
                        </div>
                    </td>
                </tr>
            </table>
            <input type="submit" id="placeOrderBtn" class="btn btn-primary btn-large" name="PlaceOrder"
                   value="Place Order"/>
        </div>
    </div>

</form>
<br/>
<br/>


</body>
</html>



