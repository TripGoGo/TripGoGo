<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <nav class="navbar navbar-expand-lg" style="background-color: black">
        <div class="container">
          <a class="navbar-brand" href="index.html"> TripGoGo </a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav align-items-lg-center ms-auto me-lg-5">
              <li class="nav-item">
                <a class="nav-link click-scroll" href="index.html#section_1">Home</a>
              </li>

              <li class="nav-item">
                <a class="nav-link click-scroll" href="index.html#section_2">About</a>
              </li>

              <li class="nav-item">
                <a class="nav-link click-scroll" href="index.html#section_3">Info</a>
              </li>

              <li class="nav-item">
                <a class="nav-link click-scroll" href="index.html#section_4">Route</a>
              </li>

              <li class="nav-item">
                <a class="nav-link click-scroll" href="${root}/board?action=list">Board</a>
              </li>
            </ul>
            <a href="ticket.html" class="btn custom-btn d-lg-block d-none">Login</a>
          </div>
        </div>
      </nav>