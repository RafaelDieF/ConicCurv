% Corner estimation in L_curve

function [Cp,maxC,I] = max_L_curva(P)

n = length(P);
for s =1:n
    P(s,3) = 1;
end

% Estimate tangents
t=zeros(n,3);
t(1,:) = pascalH1(P(1,:),P(2,:),P(3,:),P(4,:),P(5,:));
t(2,:) = pascalH2(P(1,:),P(2,:),P(3,:),P(4,:),P(5,:));

for i = 3:n-2
    t(i,:) = pascalH3(P(i-2,:),P(i-1,:),P(i,:),P(i+1,:),P(i+2,:));
end

t(n-1,:) = pascalH4(P(n-4,:),P(n-3,:),P(n-2,:),P(n-1,:),P(n,:));
t(n,:)   = pascalH5(P(n-4,:),P(n-3,:),P(n-2,:),P(n-1,:),P(n,:));

% Estimate curvature
C = nan(n,2); Cp = nan(n,1);
for j=2:n-1
    kl = estima_curvatura_m_Hl(P(j-1,:),P(j,:),t(j,:),P(j+1,:),t(j+1,:));
    kr = estima_curvatura_m_Hr(P(j-1,:),t(j-1,:),P(j,:),t(j,:),P(j+1,:));
    C(j,1) = kl; C(j,2) = kr;
    % Assign average
    Cp(j) = (kl + kr)/2;
end

C(1,1) = estima_curvatura_e_Hl(P(1,:),t(1,:),P(2,:),t(2,:),P(3,:));
Cp(1) = C(1,1);
C(n,2) = estima_curvatura_e_Hr(P(n-2,:),P(n-1,:),t(n-1,:),P(n,:),t(n,:));
Cp(n) = C(n,2);
[maxC,I] = max(Cp);

end