% Compute distortion using euclidean distance

function perc = evaluate_distorsion_eucl_dist(eps, n, m)

    perc = ( eps / (n(1)*m(2)*sqrt(100^2 + 255^2 + 255^2)) )*100;

end