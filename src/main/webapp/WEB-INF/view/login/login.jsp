<%--
  Created by IntelliJ IDEA.
  User: katou
  Date: 7/23/2022
  Time: 8:08 AM
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<section class="vh-100" style="background-color: #cde0f5;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQoAAAC9CAMAAAB8rcOCAAAAPFBMVEX///+qqqqkpKSnp6f6+vqurq6rq6vFxcXt7e3l5eX29vbg4ODU1NTIyMjp6enNzc26urqzs7O/v7/a2tqIMzngAAAD1klEQVR4nO2d2aKbMAxEsYzZCYH8/782Jrm5gSy3DWrVMXOeebAmlizJS7KMEEIIIYQQQgghhBBCCCGEEEIIIYQQQgghZI80dWU9hP+CdnIig/Uo7Gl6Ee+c760HYk1eRh0cpchOVyHOUuzcQSZxX/iT9WAsaQp/U8LJwXo4hjR3QpylyK3HY8dSCTdaj8eQsFBiz1FzWk4K2W+y2cpCiT37x3JOOGmtB2TGsJIiWA/IjFw4Ka50y0nhj9YDsqNYTYr9pleHpX/s2D1WQXPXTZtFoiml9XAsufcP2XXLprqTQnbdpsjqmxQ+7Lf0mPmqP7zvrIdiTZwV3kvo9ptOfHFOK8LU7dw19kxTn7ph6Np3U6DqyjEUYTyWXZ2qy7SlE/Ez4qf2qZntFD+5RlEvMnbNvx7mX6cqRe7z67OdU7365lB6WTUunJfj+jNsmunBxmhlcfeb51148s382ZhQSB2eGzn/5rOj5O0zrb5z0FTqkia8sTImFGOQd0LEr4okJsa6mf0ZkkDEOKkokUJDp1NSAn9DWcc7LnjoFKNSVOJcwlubswVFIcCbntP7JfKP8B55Pa01A0WALs3Czxb+thLYW+taGYVDj5gP23+bpID2Ds2UAj27OqotH+gHsxq9SQEeKLKT2qSAL0r1/AN7Hc2We8KbgK/O9Qoxb23KVtRCBf7FkFJLCvigmY1KSiRwRk1LCfik4uFQ6sf4ydqUrajlmvhRU20tRa8/NKWAP5REKW7QQW7oSQG/ia5XgsBfiFBs3FibshW1FMsJ9E5pRK+xid6u0NsOws+89fp5Ym3KVno9D0G/F6HX8IYv0w+Ke2PggVNvNXXwqYXmiQLw5Futz+vgW72KcRM95VSsQiLQWiieNEHXQi/JmkE+oKd5Pi8iwK09ZSmcjLBOormcznjpQXcNtT1kFsPaqA9RVwI371y/a7Qd2FOLylnWmcLapI/Ra2VdAN4qU08tQBeQiGKl7sA7vppXx9CfW9SsycAfUVO8EwI+KTSjBfik0FxEsDtZEa3cAv98mlrKCX/UO9O6lY6+L3RhVHAR+Jh5QcNFwK8U3tieXKThHpGtqwh08bEk3zorrA1QZNvZRfSMe8mWcJHac6Sf7wTAtnZf8mnoTCSjWPBcCy/iixAK/+KVsBSVWPxp0k2Hoq+vBWfT9u5RDUlnGV0wyEqIcrU0HFYv6XnkLeP3VOH7cWYpnr3F2wzf70x6OSa1iq5oj/FpUZGifLnP1ZaFRIo+ZSEi+aFtDz80pPKqqhKpvwghhBBCCCGEEEIIIYQQQgghhBBCCCGEEEIu/AKpWyYNnnEHrgAAAABJRU5ErkJggg=="
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; max-width: 120%; height: 100%" />
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">
                                <div class="text-danger">${mess}</div>
                                <form method="post">

                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                        <span class="h1 fw-bold mb-0"></span>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                                    <div class="form-outline mb-4">
                                        <input type="email" id="form2Example17" class="form-control form-control-lg" name="email" />
                                        <label class="form-label" for="form2Example17">Email address</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="form2Example27" class="form-control form-control-lg" name="password"/>
                                        <label class="form-label" for="form2Example27">Password</label>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                                    </div>

                                    <a class="small text-muted" href="#!">Forgot password?</a>
                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="#!"
                                                                                                              style="color: #393f81;">Register here</a></p>
                                    <a href="#!" class="small text-muted">Terms of use.</a>
                                    <a href="#!" class="small text-muted">Privacy policy</a>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
