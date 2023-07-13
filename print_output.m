function print_output( x, i, y, proPer)
    
       
        
    if y==1
        figure;
        imagesc(x);
        set(gca , 'YDir', 'normal');colorbar;
        xticks(1:10:128)
        xticklabels({'A1','A11','A21','A31', 'B9' , 'B19' , 'B29' , 'C7', 'C17' , 'C27' , 'D5' , 'D15' , 'D25'});
        yticks(1:10:128)
        yticklabels({'A1','A11','A21','A31', 'B9' , 'B19' , 'B29' , 'C7', 'C17' , 'C27' , 'D5' , 'D15' , 'D25'});
        xlabel ( 'Electrodes');                               % labeling x axes 
        ylabel ( 'Electrodes');                               % labeling y axes 
        title(['phase locking value of subject ',char(96+i)]);
        saveas(gcf, "Results/plv/plv "+char(i+96), 'jpeg'); close;
        
    elseif y==2
        figure;
        imagesc(x);
        set(gca , 'YDir', 'normal');colorbar;
        xticks(1:10:128)
        xticklabels({'A1','A11','A21','A31', 'B9' , 'B19' , 'B29' , 'C7', 'C17' , 'C27' , 'D5' , 'D15' , 'D25'});
        yticks(1:10:128)
        yticklabels({'A1','A11','A21','A31', 'B9' , 'B19' , 'B29' , 'C7', 'C17' , 'C27' , 'D5' , 'D15' , 'D25'});
        xlabel ( 'Electrodes');                               % labeling x axes 
        ylabel ( 'Electrodes');                               % labeling y axes 
        title(['phase lag index of subject ',char(96+i)]);    
        saveas(gcf, "Results/pli/pli"+char(i+96), 'jpeg'); close;
         
    elseif y==3 
         close;                                                % close histogram
         plot(x);                                              % ploting the results of rho
         title(['Rho index of subject ',char(96+i)]);          % to title each plot to stop confusing
         xlabel ( 't_{seconds}');                              % labeling axes x
         ylabel ( 'Rho value');                                % labling axes y
         xticks(1:2:proPer);
         saveas(gcf,"Results/rho/rho " +char(i+96), 'jpeg')
         close;
         
    end % end if
end % end func