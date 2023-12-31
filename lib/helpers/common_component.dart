import 'dart:ui';
import 'package:ageo/ageoConfig.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class CommonComponent{
  final GlobalKey _globalKey = GlobalKey();
  late CustomThemeData _appTheme;
  // final CustomToastMessage _toastMessage=CustomToastMessage();
  final CustomUrlLauncher _customUrlLauncher=CustomUrlLauncher();

  final String _educationalContent='''
  
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Educational Content</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <style>
    .dataTables_empty {
      display: none;
    }

    body,
    html {
      font-family: "Work Sans", sans-serif;
      font-size: 16px;
      background-color: #f1f5f7;
      color: #18050D;
    }

    .fw-medium {
      font-weight: 600;
    }

    .text-primary {
      color: #105268 !important;
    }

    a {
      color: #105268;
      text-decoration: none;
    }

    .text-underline {
      text-decoration: underline;
      cursor: pointer;
    }

    .pointer {
      cursor: pointer;
    }

    .form-group {
      margin-bottom: 1rem;
    }

    .form-group label {
      font-size: 14px;
      margin-bottom: 4px;
      display: inline-block;
    }

    .form-select:invalid:focus,
    .form-select:focus,
    .form-select:hover,
    .form-control:invalid:focus,
    .form-control:focus,
    .form-control:hover,
    .form-control.is-invalid:focus:invalid:focus,
    .form-control.is-invalid:focus:focus,
    .form-control.is-invalid:focus:hover,
    .was-validated:invalid:focus,
    .was-validated:focus,
    .was-validated:hover {
      outline: none;
      box-shadow: none;
      border-color: #105268;
    }

    .form-check .form-check-input:checked {
      background-color: #105268;
      border-color: #105268;
    }

    .form-check .form-check-input:focus {
      outline: none;
      box-shadow: none;
    }

    .btn:not(.btn-ic) {
      padding: 9px 30px;
      line-height: 1;
      border-radius: 4px;
      vertical-align: middle;
    }

    .btn:not(.btn-ic) img,
    .btn:not(.btn-ic) i {
      vertical-align: middle;
    }

    .btn-sm {
      padding: 4px 16px !important;
    }

    .btn-ic {
      display: inline-block;
      padding: 0;
      width: 36px;
      height: 36px;
      line-height: 34px;
      border-radius: 50%;
    }

    .btn-ic.btn-outline {
      border: 1px solid #18050D;
    }

    .btn-primary {
      background-color: #105268;
      border-color: #105268;
    }

    .btn-primary:active,
    .btn-primary:hover,
    .btn-primary:focus {
      background-color: #fff !important;
      color: #105268 !important;
      outline: none !important;
      box-shadow: none !important;
    }

    .btn-primary-o {
      color: #105268;
      background-color: transparent;
      border-color: #105268;
    }

    .btn-primary-o:active,
    .btn-primary-o:hover,
    .btn-primary-o:focus {
      background-color: #105268;
      color: #fff;
      outline: none;
      box-shadow: none;
    }

    .btn-link {
      text-decoration: none;
      color: #105268;
    }

    .auth .card {
      border: 0;
    }

    .auth .card h1 {
      font-size: 2em;
      padding: 0;
      margin: 0 0 30px;
      text-align: center;
    }

    .auth .card h1 small {
      display: block;
      font-size: 14px;
      margin: 4px 0 0;
    }

    .sideNav {
      position: fixed;
      left: 0;
      top: 48px;
      bottom: 0;
      width: 60px;
      z-index: 999;
      background-color: #fff;
      box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075) !important;
      transition: all 0.3s ease-in;
      overflow: hidden;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .sideNav:hover {
      width: 230px;
    }

    .sideNav:hover .nav .nav-item .nav-link span {
      transition-delay: 0.3s;
      display: inline-block;
    }

    .sideNav .nav .nav-item {
      padding: 0;
      margin: 0;
      width: 100%;
      border-bottom: 1px solid #D9D9D9;
    }

    .sideNav .nav .nav-item .nav-link {
      display: block;
      position: relative;
      width: 100%;
      padding: 16px;
      font-size: 14px;
      font-weight: 400;
      color: #18050D;
      white-space: nowrap;
    }

    .sideNav .nav .nav-item .nav-link img {
      width: 34px;
      display: inline-block;
      margin: 0 16px 0 0;
    }

    .sideNav .nav .nav-item .nav-link img:nth-child(2) {
      display: none;
    }

    .sideNav .nav .nav-item .nav-link span {
      transition: all 0.3s ease;
      display: none;
    }

    .sideNav .nav .nav-item .nav-link.active {
      color: #105268;
    }

    .sideNav .nav .nav-item .nav-link.active img {
      display: none;
    }

    .sideNav .nav .nav-item .nav-link.active img:nth-child(2) {
      display: inline-block;
    }

    .sideNav .nav .nav-item .nav-link.active::before {
      content: "";
      display: inline-block;
      width: 6px;
      height: 100%;
      background-color: #105268;
      position: absolute;
      left: 0;
      top: 0;
    }

    .subNav {
      margin: 0 0 16px;
      padding: 0 0 8px;
      border-bottom: 1px solid #D9D9D9;
    }

    .subNav h2 {
      font-size: 16px;
      font-weight: 600;
      color: #105268;
      padding: 0;
      margin: 0;
    }

    .subNav .breadcrumb {
      margin: 0;
    }

    .subNav .breadcrumb li {
      font-size: 14px;
      color: rgba(24, 5, 13, 0.6);
    }

    .subNav .breadcrumb li.active {
      color: #105268;
      font-weight: 600;
    }

    .subNav .breadcrumb-item+.breadcrumb-item::before {
      content: "\ea6e";
      font-family: remixicon !important;
      font-style: normal;
    }

    .form-switch {
      position: relative;
      display: flex;
      flex-direction: row;
      padding: 0;
      align-items: center;
    }

    .form-switch .slider {
      display: inline-flex;
      width: 50px;
      height: 30px;
      border-radius: 30px;
      background-color: #D9D9D9;
      position: relative;
      margin: 0 8px;
    }

    .form-switch .slider::after {
      content: "";
      display: inline-block;
      position: absolute;
      width: 24px;
      height: 24px;
      border-radius: 50%;
      background-color: #A9A1A4;
      transition: all 0.3s ease-in-out;
      left: 4px;
      top: 3px;
    }

    .form-switch input {
      position: absolute;
      display: block;
      width: 100%;
      height: 100%;
      opacity: 0;
      z-index: 10;
      cursor: pointer;
    }

    .form-switch input:checked+.slider::after {
      -webkit-transform: translateX(18px);
      -ms-transform: translateX(18px);
      transform: translateX(18px);
      background-color: #18050D;
    }

    .main {
      min-height: 100vh;
    }

    .table {
      background-color: #fff;
    }

    .table th {
      font-weight: 600;
      white-space: nowrap;
    }

    .table th.sorting_disabled::after,
    .table th.sorting_disabled::before {
      content: "" !important;
    }

    .table th.selectAll {
      padding-right: 18px !important;
    }

    .table tr.selected * {
      box-shadow: none !important;
      background-color: #AEC5EB !important;
      color: #18050D !important;
    }

    .table tr.selected td.select-checkbox:after {
      content: "" !important;
      margin-top: -9px !important;
      margin-left: -14px !important;
      text-align: center !important;
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3e%3cpath fill='none' stroke='%23fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='m6 10 3 3 6-6'/%3e%3c/svg%3e") !important;
    }

    .table tr.selected td.select-checkbox::before {
      border-color: #105268 !important;
      background-color: #105268;
    }

    .table tr td.select-checkbox:before {
      width: 1em !important;
      height: 1em !important;
      border-radius: 0.25em !important;
      left: 30% !important;
      border: 1px solid rgba(0, 0, 0, 0.25) !important;
    }

    .dataTables_wrapper .dt-buttons {
      display: inline-block;
      width: calc(100% - 432px);
      text-align: right;
      padding: 0 16px;
    }

    .dataTables_wrapper .dataTables_length {
      display: inline-block;
    }

    .dataTables_wrapper .dataTables_filter {
      display: inline-block;
    }

    .dataTables_wrapper .row:first-child .col-md-6:last-child {
      text-align: right;
    }

    .table tr td .btn-ic.dropdown-toggle::after {
      display: none;
    }

    .page-item.active .page-link {
      background-color: #105268;
      border-color: #105268;
    }

    .page-item.active .page-link:focus,
    .page-item.active .page-link:hover {
      box-shadow: none;
      outline: none;
      background-color: #105268;
      color: #fff;
      border-color: #105268;
    }

    .form-card {
      padding: 1.5rem;
      border: 0;
    }

    .data-card {
      border: 0;
      padding: 1rem 1rem 0;
      margin: 0;
      position: relative;
    }

    .data-card .card-top-actions {
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: space-between;
    }

    .data-card .card-top-actions .status {
      font-size: 16px;
      font-weight: 600;
      padding: 0;
      margin: 0 16px 0 0;
      line-height: 1;
    }

    .data-card .card-actions {
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: center;
      border-top: 1px solid #D9D9D9;
      padding: 0.5rem 1rem;
      margin: 1rem -1rem 0;
    }

    .pData {
      display: block;
      font-size: 16px;
      margin: 0 0 1rem;
      font-weight: 400;
      color: #18050D;
      line-height: 22px;
    }

    .pData label {
      display: block;
      color: #18050D;
      font-weight: 600;
      padding: 0;
      margin: 0 0 4px;
      line-height: 1;
    }

    .pData i {
      vertical-align: middle;
    }

    .cursor {
      cursor: pointer;
    }

    .gm-style-iw {
      max-width: 100% !important;
      width: auto;
    }

    .marker-pop-up {
      color: #18050D;
    }

    .marker-pop-up * {
      position: relative;
      z-index: 10;
    }

    .marker-pop-up h4 {
      font-size: 18px;
      font-weight: 600;
      padding: 0;
      margin: 0 0 16px;
    }

    .marker-pop-up h4 span {
      display: inline-block;
      font-size: 12px;
      font-weight: 400;
      padding: 0;
      margin: 0 0 8px;
      padding: 4px 10px;
      border-radius: 20px;
      margin: 4px 0 0 0;
      color: #fff;
    }

    .marker-pop-up h4 span.PENDING {
      background-color: #105268;
    }

    .marker-pop-up h4 span.APPROVED {
      background-color: #7AD559;
    }

    .marker-pop-up h4 span.ARCHIVED {
      background-color: #646061;
    }

    .marker-pop-up h4 span.REJECTED {
      background-color: #E27059;
    }

    .marker-pop-up .content {
      font-size: 14px;
    }

    .marker-pop-up.LANDSLIDE::after {
      content: "";
      display: block;
      opacity: 0.3;
    }

    .marker-pop-up.LANDSLIDE h4 {
      color: #C49146;
    }

    .marker-pop-up.ROCKFALL h4 {
      color: #F08330;
    }

    .marker-pop-up.FLOODED h4 {
      color: #4076AF;
    }

    .marker-pop-up.TSUNAMI h4 {
      color: #73B7FE;
    }

    .marker-pop-up.EARTHQUAKE h4 {
      color: #994200;
    }

    .marker-pop-up.BUILDING_SETTLEMENT h4 {
      color: #9D9C9E;
    }

    .marker-pop-up.SINKHOLE h4 {
      color: #A05217;
    }

    .marker-pop-up.ERUPTION h4 {
      color: #EB3131;
    }

    .marker-pop-up.WILDFIRE h4 {
      color: #EB3131;
    }

    .education-content h1 {
      font-size: 26px;
      font-weight: 600;
      color: #105268;
      padding: 0;
      margin: 0 0 30px;
      text-align: center;
    }

    .education-content .card {
      padding: 1rem;
      border: 0;
      background-color: #fff;
      margin: 0 0 16px;
    }

    .education-content .card h2 {
      font-size: 22px;
      font-weight: 600;
      color: #105268;
      padding: 0;
      margin: 16px 0;
    }

    .education-content .card h3 {
      font-size: 20px;
      font-weight: 600;
      padding: 0;
      margin: 16px 0 8px;
      color: #105268;
    }

    .education-content .card h4 {
      font-size: 18px;
      font-weight: 600;
      color: #18050D;
      padding: 0;
      margin: 16px 0 8px;
    }

    .education-content .card h5 {
      font-size: 16px;
      font-weight: 500;
      padding: 0;
      margin: 16px 0 8px;
    }

    .education-content .card p {
      font-size: 16px;
      color: #18050D;
      padding: 0;
      margin: 0 0 16px;
    }

    .education-content .card li {
      font-size: 16px;
      color: #18050D;
    }

    .education-content .card .blueBox {
      background-color: #105268;
      color: #fff;
      padding: 1rem;
      margin: 0 0 16px;
    }

    .education-content .card .blueBox h2,
    .education-content .card .blueBox h3,
    .education-content .card .blueBox h4,
    .education-content .card .blueBox p,
    .education-content .card .blueBox li {
      color: #fff;
    }

    /* media queries */
    @media only screen and (max-width: 767px) {
      .sideNav {
        left: -100%;
        width: 230px;
        transition: all 0.3s ease-in-out;
      }

      .sideNav.active {
        left: 0;
      }

      .sideNav .nav .nav-item .nav-link span {
        display: inline-block;
      }

      .nav-backdrop {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 700;
      }

      .main {
        padding: 64px 16px 16px;
      }

      
    }
    .event-badge {
      border: 1px solid #c2d1d6;
      border-radius: 20px;
      padding: 15px 15px;
      text-align: center;
    }

    .event-badge img {
      max-width: 100%;
    }

    /*# sourceMappingURL=style.css.map */
  </style>
</head>

<body>
  <div class="main">
    <div class="education-content">
      <div class="row justify-content-center">
        <div class="col-lg-9 col-xl-6">
          <div class="card" id="education-content"></div>
        </div><!-- col -->
      </div><!-- row -->
    </div><!-- educational-content -->
  </div><!-- main -->
</body>
<script>
  // var urlParams = new URLSearchParams(location.search)
  // console.log('location', window.location.href)
  // console.log('search', window.search)
  // var eventType = urlParams.get('eventType') ? urlParams.get('eventType') : 'ALL'
  // var anchorSection = urlParams.get('anchorSection')
  // changeEducationalContent(eventType,anchorSection)
  // if(anchorSection) {
  //   scrollDownToView(anchorSection)
  // }
  function changeEducationalContent (_eventType,_anchorSection) {
  console.log(" changeEducationalContent called",_eventType)
  console.log(" Anchor section=>",_anchorSection)
    switch (_eventType) {
      case 'ALL':
        document.getElementById('education-content').innerHTML = `<div class='row'><h2 class='text-center'>Select an event</h2><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("TSUNAMI")'><div class='event-badge cursor h-100'><img src='./event_icons/TSUNAMI.svg' /><p class='mb-0 mt-2'>Tsunami</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("EARTHQUAKE")'><div class='event-badge cursor h-100'><img src='./event_icons/EARTHQUAKE.svg' /><p class='mb-0 mt-2'>Earthquake</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("ROCKFALL")'><div class='event-badge cursor h-100'><img src='./event_icons/ROCKFALL.svg' /><p class='mb-0 mt-2'>Rockfall</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("SINKHOLE")'><div class='event-badge cursor h-100'><img src='./event_icons/SINKHOLE.svg' /><p class='mb-0 mt-2'>Sinkhole</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("ERUPTION")'><div class='event-badge cursor h-100'><img src='./event_icons/ERUPTION.svg' /><p class='mb-0 mt-2'>Eruption</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("LANDSLIDE")'><div class='event-badge cursor h-100'><img src='./event_icons/LANDSLIDE.svg' /><p class='mb-0 mt-2'>Landslide</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("RIVER_FLOODING")'><div class='event-badge cursor h-100'><img src='./event_icons/RIVER_FLOODING.svg' /><p class='mb-0 mt-2'>River Flooding</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("MARINE_FLOODING")'><div class='event-badge cursor h-100'><img src='./event_icons/MARINE_FLOODING.svg' /><p class='mb-0 mt-2'>Marine Flooding</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("COASTAL_EROSION")'><div class='event-badge cursor h-100'><img src='./event_icons/COASTAL_EROSION.svg' /><p class='mb-0 mt-2'>Coastal Erosion</p></div></div></div><div class='col-6 col-md-3 my-2'><div onclick='changeEducationalContent("BUILDING_SETTLEMENT")'><div class='event-badge cursor h-100'><img src='./event_icons/BUILDING_SETTLEMENT.svg' /><p class='mb-0 mt-2'>Building Settlement</p></div></div></div></div>`
        break;
      case 'TSUNAMI':
        document.getElementById('education-content').innerHTML = "<h1>Tsunami</h1><ol><li><h3 id='whatToDo'>What to do</h3><ul class='px-0'><li><h4>Reducing risks from tsunamis</h4><p>Scientists cannot predict when and where the next tsunami will strike. However, there are tsunamiwarning centers that monitor which earthquakes are likely to generate tsunamis and can issuemessageswhen one is possible. They monitor networks of deep-ocean and coastal sea-level observationsystemsdesigned to detect tsunamis and use information from these networks to forecast coastal impactsandguide local decisions about evacuation. Tsunami warning capabilities have become dramaticallybettersince the 2004 Indian Ocean tsunami and there are several tsunami early warning operations in theNorth Atlantic and Mediterranean region as well as throughout the world.</p><p>The source of a tsunami has a direct impact on the amount of warning time available. This rangesfrom adistance source (more than 3 hours away) to a regional source (1 to 3 hours away) and a localsource(less than an hour away). In some local cases there may only be a few minutes’ warning.</p><p>Despite significant developments in tsunami early warning centers, there are still a number ofoperational weaknesses that exist including an inability to detect landslide and volcanic sources,and aninability to provide early enough warnings for local tsunamis except in a few areas.</p><p>Tsunami warnings come in different forms. There are official warnings issued by tsunami warningcenters that are broadcast through local radio and television, websites, and social media. Theymayalsocome through outdoor sirens, local officials, text message alerts, and telephone notifications.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared</h3><p>There may not be time to wait for an official warning, so it is important to be able to recognizenaturaltsunami warnings. These include strong or long earthquakes, a loud roar (like that of a train or anairplane) coming from the ocean, and a sudden rise or fall of the sea level that is not related to thetide.Official and natural warnings are equally important.</p><p>For those living in coastal areas at risk from tsunamis it is important to be prepared to respondimmediately to any tsunami warnings. Move quickly to a safe place by following posted evacuationsigns. If you do not see an evacuation route, go to high ground or as far inland as possible.</p><p>When they strike land, most tsunamis are less than 3m high, but in extreme cases, they can exceed 30mnear their source. A tsunami may come onshore like a fast-rising flood or a wall of turbulent water,anda large tsunami can flood low-lying coastal areas several kilometers inland.</p></li><li><h3 id='about'>About</h3><ul class='px-0'><li><h4>What is a tsunami?</h4><p>A tsunami is a series of extremely long waves caused by a large and sudden displacement of theocean,usually the result of an earthquake below or near the ocean floor but sometimes by underwaterlandslides or volcanic eruptions. This force creates waves that radiate outward in all directionsawayfrom their source, sometimes crossing entire ocean basins. Unlike wind-driven waves, which onlytravelthrough the topmost layer of the ocean, tsunamis move through the entire water column, from theocean floor to the ocean surface.</p></li><li><h4>Why do tsunamis occur?</h4><p>Most tsunamis are caused by earthquakes on converging tectonic plate boundaries. However,tsunamiscan also be caused by landslides, volcanic activity, and possibly by near-earth objects (e.g.,asteroids,comets) colliding with or exploding above the ocean.</p><p>When an event like an underwater earthquake happens, the movement forces a lot of water to movevery quickly. The whole water column (the water from surface all the way to the seafloor) moves atspeeds of up to 1000km per hour away from the earthquake location. Because of the way tsunamis arecaused, they produce multiple waves (like the ripples you get when you drop a stone into water).Asthefront edge of the wave gets to shallower water it slows. However, the back of the wave in thedeeperwater is still moving fast so the water ‘piles up’, and the tsunami wave height increases as itreaches thecoast. Sometimes it looks like the water sucks down and away from the coast, then rushes back inwithenormous speed and force. When the wave reaches the shore, it travels inland on gentle slopes orflatland or pushes uphill on steep slopes, travelling at speeds like a fast car. As the waves move,theycarrydebris (like trees, rocks, boats, vehicles or bits of building) that cause damage.</p><p>Once a tsunami forms, its speed depends on the depth of the ocean. In the deep ocean, a tsunamicanmove as fast as a jet plane, over 500 mph, and its wavelength, the distance from crest to crest,maybehundreds of miles. Mariners at sea will not normally notice a tsunami as it passes beneath them;indeepwater, the top of the wave rarely reaches more than three feet higher than the ocean swell.Erosionisthe geological process in which earthen materials are worn away and transported by natural forcessuchas wind or water.</p></li></ul></li></ol>"
        break;
      case 'EARTHQUAKE':
        document.getElementById('education-content').innerHTML = "<h1>Earthquake</h1><ol><li><h3 id='whatToDo'>What to do?</h3><ul class='px-0'><li><h4>During an earthquake</h4><p>If you can, inform affected neighbours and contact your public works, fire, or police department.</p><p>In the event of severe storms or flooding it can lead to erosion that threatens where you liveandwork.</p><h5><strong>Indoors</strong></h5><p>Drop: Drop to the ground before the earthquake causes you to fall.</p><p>Cover: Take cover under a piece of sturdy furniture such as a desk or table to protect your headand torso from falling objects</p><p>Hold: Hold on to the object you are under to remain covered</p><h5><strong>Outdoors</strong></h5><p>Go to an open area away from buildings. If you are near a coastline move to higher ground. Inyourcar</p><p>Watch for collapsed pavement, mud, fallen rocks and other debris flow. Avoid bridges and roadswithflowing mud.</p></li><li><h4>What to do next:</h4><h5>Get shoes</h5><p>Before going anywhere, even to the next room.</p><h5>Turn off gas and electricity</h5><p>If you can, turn off the gas and electricity to the building. If you can’t, evacuate.</p><h5>Avoid damaged buildings</h5><p>Expect aftershocks and damaged structures. Evacuate the building, and head for a safe meetingpoint.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared?</h3><ul class='px-0'><li><h4>Prepare an emergency kit:</h4><p>Make sure you bring the items to survive for the next few days: water, food, whistle, radio andbatteries.</p></li><li><h4>Set a meeting point</h4><p>Pick a location where your family will meet outside of your home and neighborhood.</p><p>Move heavy items to lower shelves, beds, and chairs away windows.</p><p>Don't hang heavy pictures and other items over beds.</p><p>Protect your valuable belongings with anti-skid pads, Velcro and safety straps.</p><p>Secure tall furniture and heavy objects, lamps, paintings, and mirrors, with latches and hooks.</p><p>Retrofit chimneys, balconies, and roof.</p></li></ul></li><li><h3 id='about'>About</h3><ul class='px-0'><li><h4>What is an earthquake and what causes them to happen?</h4><p>An earthquake is caused by a sudden slip on a fault. The tectonic plates are always slowly moving,butthey get stuck at their edges due to friction. When the stress on the edge overcomes the friction,thereis an earthquake that releases energy in waves that travel through the earth&#39;s crust and causetheshaking that we feel. Millions of earthquakes hit Europe every year, though most are too small tobefeltor to cause damage. However, severe events occur periodically. Each time such a strong earthquakeaffects a region in Europe, it reminds us of the impact it can have. In Europe, earthquakes aremainly aresult of stress in the earth’s crust. For naturally occurring earthquakes, the source of thisstress is platetectonics. The Eurasian plate encompasses much of Europe’s and Asia’s mainland. It shifts towardstheneighboring plates in the South (African plate), Southeast (Anatolian microplate), and West (NorthAmerica plate).</p></li></ul></li></ol>"
        break;
      case 'LANDSLIDE':
        document.getElementById('education-content').innerHTML = "<h1>Landslide</h1><ol><li><h3 id='whatToDo'>What to do</h3><ul class='px-0'><li><h4>During landslide:</h4><h5><strong>Indoors</strong></h5><p>Take shelter under a strong table or a bench. Hold on firmly and stay put until all movement hasstopped.</p><h5><strong>Outdoors</strong></h5><p>If you are in the path of a landslide move uphill as quickly as possible. Avoid river valleys.</p></li><li><h4>What to do next:</h4><h5><strong>Avoid damaged area</strong></h5><p>Stay away from the slide area. There may be danger of additional slides. Prepare for secondaryriskssuch as flooding, downed power lines, and damaged buildings.</p><h5><strong>Stay alert</strong></h5><p>Listen to local radio or television stations for the latest emergency information.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared:</h3><ul class='px-0'><li><h4>Prepare an emergency kit:</h4><p>Make sure you bring the items to survive for the next few days: water, food, whistle, radio, andbatteries.</p></li><li><h4>Set a meeting point</h4><p>Pick a location where your family will meet outside of your home and neighborhood.</p></li><li><h4>Be familiar with landslide and debris flow warning signs:</h4><ul><li>Near the slope crest: recent cracks.</li><li>Near the slope toe: new cracks appear in plaster, tile, brick, foundations, sidewalks, etc.</li><li>Doors and windows stick or jam for the first time.</li><li>Outside walls, walkways or stairs pull away from the building.</li><li>Underground utility lines break.</li><li>The ground slides downward and may begin to shift.</li><li>Fences, utility poles, decks, floors, retaining walls and trees tilt or move.</li></ul></li></ul></li><li><h3 id='about'>About</h3><ul class='px-0'><li><h4>What is a landslide and what causes one?</h4><p>A landslide is the movement of a mass of rock, debris, or earth down a slope.</p><p>Landslides encompass five modes of slope movement:</p><ul><li>falls,</li><li>topples,</li><li>slides,</li><li>spreads, and</li><li>flows.</li></ul><p>Landslides occur when earth slides down the side of a hill or mountain, often carrying with itrocks,plants and other debris.Almost every landslide has multiple causes. Landslides can be initiated inslopes already on the verge of movement by rainfall, snowmelt, changes in water level, streamerosion, changes in ground water, earthquakes, volcanic activity, disturbance by human activities,orany combination of these factors.</p><p>Earthquake shaking and other factors can also induce landslides underwater. These landslides arecalled submarine landslides. Submarine landslides sometimes cause tsunamis that damage coastalareas.</p></li></ul></li></ol>"
        break;
      case 'ROCKFALL':
        document.getElementById('education-content').innerHTML = "<h1>Rockfall</h1><ol><li><h3 id='whatToDo'>What to do</h3><ul class='px-0'><li><h4>During landslide:</h4><p>Find cover: In the event of a rockfall, if you are unable to avoid the rockfall, find coverbehinda solid structure or boulder. Avoid trying to outrunthe falling rocks, as they can move at high speeds.</p></li><li><h4>What to do next:</h4><p>After the rocks have stopped falling, move away from the cliff and toward a safe location.Avoid the area until it has been assessed and made safe.</p></li><li><h4>Keep in touch</h4><p>Let friends and family know you’re safe. Use text messages or social media to contact family andfriends. Stay alert by monitoring local news and reports.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared:</h3><ul class='px-0'><li><h4>Prepare an emergency kit:</h4><p>Make sure you bring the items to survive for the next few days: water, food, whistle, radio andbatteries.</p></li><li><h4>Set a meeting point</h4><p>Pick a location where your family will meet outside of your home and neighbourhood.</p></li><li><h4>Know your risk:</h4><p>Be aware of the potential risks in your area and take steps to protect yourself and yourproperty.Avoid building near steep slopes and cliffs.Look for signs of recent falling and rock movement, such as displaced or damaged vegetation orfreshscars on cliffs. Check weather forecasts for heavy rainor snow, as these conditions can increase the likelihood of a rockfall.Lookout for small rocks in the roadway - since bigger rocks could be looming.Make sure you have a plan in case you have to move to a safer place.</p></li></ul></li><li><h3 id='about'>About</h3><ul class='px-0'><h4>What is a rockfall and what causes one?</h4><p>A rockfall is a natural phenomenon that occurs when rocks break free from a cliff or mountainsideandfall to the ground below. Rockfallscan be very dangerous, depending on the size of the rocks, the speed at which they fall, and wherethey fall. They can cause propertydamage, personal injury, or even loss of life.</p><p>Rockfalls can be caused by a variety of factors, including rainfall, erosion, and seismic activity.Rockfalls are a common erosionalprocess in mountainous areas near cliffs of broken, faulted, or jointed bedrock. They are oftencatastrophic and without warning,making it difficult to predict how often they occur. Keep in mind that recent fires have impactedslope stability and events like heavy rain or earthquakeswill exacerbate rock-fall potential. In some cases, human activities such as mining or constructioncan also trigger rockfalls.</p></ul></li></ol>"
        break;
      case 'BUILDING_SETTLEMENT':
        document.getElementById('education-content').innerHTML = "<h1>Building Settlement</h1><ol><li><h3 id='whatToDo'>What to do?</h3><ul class='px-0'><li><h4>If you suspect imminent danger:</h4><p>Walk away immediately, and stay away. Do not try to get close to the settlement.Prepare to evacuate immediately if the building becomes unstable.Make sure that you know where valuable documents are located and that you have a safe location togoto.</p></li><li><h4>Report the settlement:</h4><p>Do not hesitate to contact your local officials, fire or police department. In the event ofseverestorms or flooding it can weaken the soil underneath that threatens where you live and work.</p></li><li><h4>What to do next:</h4><p>Avoid damaged area. Stay away from the damaged area, until local officials declare it is safe.</p></li><li><h4>Keep in touch:</h4><p>Let friends and family know you’re safe. Stay alert by monitoring local news and reports.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared</h3><ul class='px-0'><li><h4>Be familiar with warning signs:</h4><p>In cases of minor settlement, which could be due to cyclic or seasonal movement, small hairlinecracks may appear in plaster. In more serious cases, doors and windows may develop stickingproblems, and plumbing and mechanical equipment may be adversely affected.</p><p>It is rare for settlement to affect the structure of the building. Whilst situations vary fromsiteto site, a general rule is that a crack is considered to be of a structural nature if itapproachesor exceeds a width of 6 mm.</p></li><li><h4>Stay informed:</h4><p>If you are noticing cracks in your interior walls, floor cracks or sticking doors and/or windows,there’s a chance your house may be settling. </p></li></ul></li><li><h3 id='about'>About</h3><p>What is a building settlement and what causes one?Building settlement is the downward movement of a building's foundation due to the consolidation ofthesoil underneath it.</p><p>It is usual for buildings to experience some degree of settlement within the first few years afterconstruction, unless there are changes in the drainage patterns around the building, severe changes inweather, or other external factors. The extent to which the ground movement impacts upon buildingsdepends on several factors, which may include:</p><ul><li>Existing soil conditions.</li><li>Methods of construction.</li><li>Size and depth of the construction works.</li><li>Type of structure, its condition, and its foundations.</li></ul></li></ol>"
        break;
      case 'SINKHOLE':
        document.getElementById('education-content').innerHTML = "<h1>Sinkhole</h1><ol><li><h3 id='whatToDo'>What to do?</h3><ul class='px-0'><li><h4>If you suspect imminent danger:</h4><p>Walk away immediately, and keep away from it. In particular, make sure you keep children awayfrom the possible sinkhole area.Prepare to evacuate immediately if the hole is affecting your house in any way.Make sure that you know where valuable documents are located and that you have a safe location togo to.</p></li><li><h4>Report the sinkhole:</h4><p>Do not hesitate to contact your local officials, fire or police department. In the event ofsevere storms or flooding it can create cavities and voids underground that threaten where youlive and work.</p></li><li><h4>What to do next:</h4><p>Stay away from the damaged area, until local officials declare it is safe.If you originally decided to stay in your home because you saw no signs of damage impact from thesinkhole, continue checking for signs of damage impact. Sinkhole dangers can evolve quickly, andyou need to remain vigilant and be ready to evacuate your home at the first sign of damage.</p></li><li><h4>Keep in touch:</h4><p>Let friends and family know you’re safe. Stay alert by monitoring local news and reports.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared</h3><ul class='px-0'><li><h4>Be familiar with warning signs:</h4><p>The most obvious signs that the hole is impacting your house include the following:</p><ul><li>Sinking, sagging, or cracking walls</li><li>Difficulty closing doors and/or windows</li><li>Cracks in floors, pavement, patios, and/or ground surface in or around the house</li></ul><p>If you notice any of these signs, call an inspector and your insurance company to assess thesituation and take necessary action.</p></li><li><h4>Make a plan:</h4><p>The key to staying safe is to prepare and to have an emergency plan in place.</p></li><li><h4>Stay informed:</h4><p>Be aware of the risks in your area and stay informed about potential sinkhole activity.</p></li></ul></li><li><h3 id='about'>About</h3><h4>What is a sinkhole and what causes one?</h4><p>A sinkhole is a depression in the ground caused by the collapse of the surface layer, often revealingunderlying rock or soil. They can form slowly or suddenly and can vary in size and depth.</p><p>Sinkholes can occur as part of the natural process of erosion. They typically form in areas wherethere is limestone near the surface of the earth. Rainwater percolating through the soil can createacidic water, which can dissolve the limestone and create cavities and voidsunderground. Over time, these cavities can cause the land above to collapse or sink.</p><p>Sinkholes can also be triggered by human activities like groundwater withdrawal, surface waterdiversion, and drilling. In urban areas, they can be hazardous and cause damage to highways andbuildings, as well as water quality problems.</p></li></ol>"
        break;
      case 'ERUPTION':
        document.getElementById('education-content').innerHTML = "<h1>Eruption</h1><ol><li><h3 id='whatToDo'>What to do</h3><ul class='px-0'><li><h4>Listen to warnings:</h4><p>Listen to radio and TV alerts and reports of eruption in progress. Be prepared to evacuate, anddo so immediately if necessary.</p><p>If a warning is issued for your area, follow recommended evacuation routes.</p><p>Avoid areas downwind and river valleys downstream from the volcano. Do not walk, drive, or try toget close to the eruption area.</p></li><li><h4>What to do next:</h4><p>Avoid damaged area</p><p>Listen to authorities and stay indoors until it is safe to go outside.</p><p>Clear roofs of ash fall. Ash can be very heavy and cause roofs to collapse.</p><p>Avoid contact with ash if you have breathing problems.</p></li><li><h4>Keep in touch</h4><p>Let friends and family know you’re safe. Use text messages or social media to contact family andfriends. Stay alert by monitoring local news and reports.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared</h3><ul class='px-0'><li><h4>Prepare an emergency kit:</h4><p>Make sure you bring the items to survive for the next few days: water, food, whistle, radio, andbatteries.</p></li><li><h4>Set a meeting point</h4><p>in case of a major eruption you should be prepared to leave that area if necessary. Pick alocation where your family will meet outside of your home and neighbourhood.</p></li><li><h4>Know your volcano hazard risk</h4><p>To understand your volcano hazard risk, use the District Plan map or other official map toidentify active volcanoes where you live, work or recreate.Ask your local officials about emergency planning efforts and evacuation routes.</p><p>Take a household inventory.</p><p>Store important documents.</p></li><li><h4>Be familiar with eruption warning signs:</h4><ul><li>An increase in the frequency and intensity of felt earthquakes</li><li>Noticeable steaming or fumarolic activity and new or enlarged areas of hot ground</li><li>Subtle swelling of the ground surface</li><li>Small changes in heat</li><li>Changes in the composition or relative abundances of fumarolic gases</li></ul></li></ul></li><li><h3 id='about'>About</h3><ul class='px-0'><li><h4>What is a volcano eruption and why do volcanoes occur?</h4><p>A volcano is a mountain that serves as a vent through which molten rock and other gases escape.When pressure from the gas and molten rock becomes too great, an eruption occurs. Volcaniceruptions can last days, months, or even years.</p><p>Many volcanic eruptions are also accompanied by other natural hazards, such as earthquakes,landslides, debris flows, flash floods, fires and tsunamis. </p></li></ul></li></ol>"
        break;
      case 'MARINE_FLOODING':
        document.getElementById('education-content').innerHTML = "<h1>Marine Flooding</h1><ol><li><h3 id='whatToDo'>What to do</h3><h4>During a flood:</h4><ul class='px-0'><li><h5>Listen to warnings:</h5><p>Listen to radio and TV alerts and reports of eruption in progress. Be prepared to evacuate at amoment’s notice.</p></li><li><h5>Go to high ground:</h5><p>If a warning is issued for your area, head for higher ground and stay there. Follow recommendedevacuation routes.Turn around, don’t drown! Avoid flood waters. Do not walk, swim, or drivethrough flood waters.</p></li><li><h5>What to do next:</h5><p><strong>Avoid damaged area</strong></p><p>Stay away from the damaged area, until local officials declare it is safe.</p><p><strong>Keep in touch</strong></p><p>Let friends and family know you’re safe. Stay alert by monitoring local news and reports.</p><p><strong>Be aware of electrocution</strong></p><p>Do not touch electrical equipment if it is wet or if you are standing in water. Turn off theelectricity ifit is safe to do so.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared</h3><ul class='px-0'><li><h4>Prepare an emergency kit:</h4><p>Make sure you bring the items to survive for the next few days: water, food, whistle, radio, andbatteries.</p></li><li><h4>Set a meeting point</h4><p>Pick a location where your family will meet outside of your home and neighborhood.</p></li><li><h4>Know your flood risk</h4><p>Know the flood risk in your community by calling your municipality and insurance company.</p><p>Get flood insurance.</p><p>Take a household inventory.</p><p>Store important documents.</p></li><li><h4>Be familiar with flooding warning signs:</h4><ul><li>Consistent heavy rains.</li><li>Overflowing rivers and streams.</li><li>Saturated ground.</li></ul></li></ul></li><li><h3 id='about'>About</h3><ul class='px-0'><h4>What is a flood and why do floods occur?</h4><p>A flood is an overflow of water onto normally dry land.</p><p>Flooding can be caused by storms, heavy rainfall, sudden melting of snow and ice in mountain areas,overflows of dams and failure of constructions in water systems.</p><h4>Types of floods:</h4><p>Floods can be categorized.</p><ul><li>By geography: flooding of rivers, river deltas, sea, and urban flooding.</li><li>By speed: ponding flood, pluvial flooding or water logging, where water forms a layer duringhighintensity rainfall, overflow of major river banks, and flash floods, where water flows with greatspeed and can come with no warning.</li></ul><p>Floods are not limited to specific areas but are widespread. In Europe flash floods, floods causedbyrivers overflowing or breaching their banks, coastal floods, urban floods, and ponding throughexcessiverainfall are all possible.</p></ul></li></ol>"
        break;
      case 'RIVER_FLOODING':
        document.getElementById('education-content').innerHTML = "<h1>River Flooding</h1><ol><li><h3 id='whatToDo'>What to do</h3><h4>During a flood:</h4><ul class='px-0'><li><h5>Listen to warnings:</h5><p>Listen to radio and TV alerts and reports of eruption in progress. Be prepared to evacuate at amoment’s notice.</p></li><li><h5>Go to high ground:</h5><p>If a warning is issued for your area, head for higher ground and stay there. Follow recommendedevacuation routes.Turn around, don’t drown! Avoid flood waters. Do not walk, swim, or drivethrough flood waters.</p></li><li><h5>What to do next:</h5><p><strong>Avoid damaged area</strong></p><p>Stay away from the damaged area, until local officials declare it is safe.</p><p><strong>Keep in touch</strong></p><p>Let friends and family know you’re safe. Stay alert by monitoring local news and reports.</p><p><strong>Be aware of electrocution</strong></p><p>Do not touch electrical equipment if it is wet or if you are standing in water. Turn off theelectricity ifit is safe to do so.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared</h3><ul class='px-0'><li><h4>Prepare an emergency kit:</h4><p>Make sure you bring the items to survive for the next few days: water, food, whistle, radio, andbatteries.</p></li><li><h4>Set a meeting point</h4><p>Pick a location where your family will meet outside of your home and neighborhood.</p></li><li><h4>Know your flood risk</h4><p>Know the flood risk in your community by calling your municipality and insurance company.</p><p>Get flood insurance.</p><p>Take a household inventory.</p><p>Store important documents.</p></li><li><h4>Be familiar with flooding warning signs:</h4><ul><li>Consistent heavy rains.</li><li>Overflowing rivers and streams.</li><li>Saturated ground.</li></ul></li></ul></li><li><h3 id='about'>About</h3><ul class='px-0'><h4>What is a flood and why do floods occur?</h4><p>A flood is an overflow of water onto normally dry land.</p><p>Flooding can be caused by storms, heavy rainfall, sudden melting of snow and ice in mountain areas,overflows of dams and failure of constructions in water systems.</p><h4>Types of floods:</h4><p>Floods can be categorized.</p><ul><li>By geography: flooding of rivers, river deltas, sea, and urban flooding.</li><li>By speed: ponding flood, pluvial flooding or water logging, where water forms a layer duringhighintensity rainfall, overflow of major river banks, and flash floods, where water flows with greatspeed and can come with no warning.</li></ul><p>Floods are not limited to specific areas but are widespread. In Europe flash floods, floods causedbyrivers overflowing or breaching their banks, coastal floods, urban floods, and ponding throughexcessiverainfall are all possible.</p></ul></li></ol>"
        break;
      case 'COASTAL_EROSION':
        document.getElementById('education-content').innerHTML = "<h1>Coastal Erosion</h1><ol><li><h3 id='whatToDo'>What to do</h3><ul class='px-0'><li><h4>Report the erosion:</h4><p>If you can, inform affected neighbours and contact your public works, fire, or police department.</p><p>In the event of severe storms or flooding it can lead to erosion that threatens where you liveandwork.</p></li><li><h4>If you suspect imminent danger:</h4><h5><strong>Outdoors</strong></h5><p>Walk away immediately and stay away.</p><h5><strong>Indoors</strong></h5><p>Prepare to evacuate immediately if the structure becomes unstable. Make sure that you knowwhere valuable documents are located and that you have a safe location to go to.</p></li><li><h4>What to do next:</h4><h5><strong>Avoid damaged area</strong></h5><p>Stay away from the damaged area, until local officials declare it is safe.</p><h5><strong>Keep in touch</strong></h5><p>Let friends and family know you’re safe. Stay alert by monitoring local news and reports.</p></li></ul></li><li><h3 id='bePrepared'>Be prepared</h3><ul class='px-0'><li><h4>Know your risk:</h4><p>Become familiar with the land around you. Find out if you live in an area where erosion can haveahuge impact on where you live and work. If your property is identified in District Plan maps as acoastal erosion area, check with local officials if they have mitigation or community plans orsuggestions for reducing erosion risk. Be familiar with warning signs: Learn how to recognizesignsof potential imminent rockfall, landslide or building collapse. Learn how to recognize signs ofdamage to your home. Erosion can cause water to collect around your foundation. When thishappens, the water can weaken your concrete foundation, or it can seep through the porous surfaceof your foundation and cause moisture issues in your home or business.</p><p>Ensure that your home is sufficiently anchored, especially if it is on sand. Using piles thatdriveintomore secure layers of the ground is highly recommended, especially for homes that are older.</p></li><li><h4>Make a plan:</h4><p>The key to staying safe is to prepare and to have an emergency plan in place.</p></li></ul></li><li><h3 id='about'>About</h3><ul class='px-0'><li><h4>What is coastal erosion and what causes it?</h4><p>Erosion is the geological process in which earthen materials are worn away and transported bynaturalforces such as wind or water.</p></li><li><h4>Coastal erosion:</h4><p>Coastal erosion is the wearing away of rocks, earth, or beach sand. It can change the shape ofentirecoastlines. During the process of coastal erosion, waves pound rocks into pebbles and pebbles intosand.Waves and currents sometimes transport sand away from beaches, moving the coastline fartherinland.Coastal erosion can have a huge impact on human settlement as well as coastal ecosystems.</p></li><li><h4>Factors Impacting Erosion:</h4><p>Some of the natural factors impacting erosion in a landscape include climate, topography,vegetation,and tectonic activity.Burrowing animals, such as beetles and worms, contribute to erosion bydisplacingsoil.Erosion is a natural process, but human activity can make it happen more quickly.</p></li></ul></li></ol>"
        break;
    }
    if(_anchorSection) {
    scrollDownToView(_anchorSection)
    }
  
  }
  function scrollDownToView(anchorSection) {
    let element = document.getElementById(anchorSection)
      let scrollOffset = 0
      let position = element.getBoundingClientRect().top
      window.scrollTo({
        top: position,
        behavior: 'smooth',
      })
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</html>
  ''';

  String get educationalContent=>_educationalContent;

  void initializeLoader({required BuildContext context,String? message}){
    // this popup loader screen with custom message
    _appTheme=Theme.of(context).customTheme;
    TextStyle inputStyle=const TextStyle(fontSize: 14,color: Colors.white);
    showDialog(context: context,barrierDismissible: false,useRootNavigator: false, builder: (BuildContext context){
      return WillPopScope(
        onWillPop:()async{
          return false;
        },
        child: Center(
          child: Container(
            padding:const EdgeInsets.all(20),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: _appTheme.primaryActionColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Icon(Icons.wifi_off_outlined,size: 40,color: Colors.white,),
                    CircularProgressIndicator(color: _appTheme.primaryActionColor,backgroundColor: Colors.white),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text("monitor_event.please_wait",style: inputStyle,textAlign: TextAlign.center,).tr(),
                    ),
                    Text("$message",style: inputStyle,textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void  showEventShareDialog({required BuildContext context,required String message}){
    // this show popup when user successfully submit event detail to backend
    // this popup allow user to share event link and copy link on clipboard
    _appTheme=Theme.of(context).customTheme;
    AgeoConfig ageoConfig=AgeoConfig();
    String eventLink="${ageoConfig.frontendBasePath}/event-details/$message";
    showDialog(context: context,barrierDismissible: false,useRootNavigator: false, builder: (BuildContext context){
      return WillPopScope(
        onWillPop:()async{
          return false;
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Center(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // height: 200,
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          // height: 180,
                          padding:const EdgeInsets.only(bottom: 20),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Image.asset("assets/images/report_event/close_ic.png",width: 28,),
                                  onPressed: (){
                                    Navigator.popUntil(context, (route) => route.isFirst);
                                    // Navigator.pop(context);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.check,color: _appTheme.primaryActionColor,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text("monitor_event.send_ageo",style: TextStyle(color:_appTheme.primaryTextColor,fontSize: 14),).tr(),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 16.0),
                                              child: TextButton(
                                                onPressed: (){
                                                  _customUrlLauncher.openInBrowser(url: eventLink);
                                                },
                                                child: Text(eventLink,style: TextStyle(color: _appTheme.primaryActionColor,fontSize: 14,decoration: TextDecoration.underline),),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Image.asset("assets/images/report_event/copy_ic.png",height: 20,),
                                            onPressed: ()async{
                                              await Clipboard.setData(ClipboardData(text: eventLink));
                                              // _toastMessage.showSuccessToastMessage(message: tr("monitor_event.linked_copied"), duration: 1, context: context);
                                              Get.showSnackbar( GetSnackBar(
                                                message: tr("monitor_event.linked_copied"),
                                                duration:const Duration(seconds: 2),
                                                icon:const Icon(Icons.done_all,color: Colors.white,),
                                                backgroundColor: _appTheme.primaryActionColor,
                                                margin:const EdgeInsets.all(12),
                                                borderRadius: 12,
                                              ));
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          key: _globalKey,
                          style: TextButton.styleFrom(
                            backgroundColor: _appTheme.primaryActionColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset("assets/images/report_event/share_ic.png",height: 15,),
                              ),
                              const Text("monitor_event.share",style: TextStyle(color: Colors.white,fontSize: 14),).tr(),
                            ],
                          ),
                          onPressed: (){
                            RenderBox box = _globalKey.currentContext?.findRenderObject() as RenderBox;
                            Offset position = box.localToGlobal(Offset.zero); //this is global position of button in app view
                            Share.share(eventLink,sharePositionOrigin: Rect.fromCenter(center: Offset(position.dx+60,position.dy+24),width: 1,height: 1));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}