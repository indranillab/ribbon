ks_statistic<-function(x1,x2)
{
	t1<-table(sort(x1))
	t2<-table(sort(x2))
	t1<-t1/sum(t1)
	t2<-t2/sum(t2)
	k<-1
	ind1<-1
	ind2<-1
	vec<-NULL
	cdf1<-0
	cdf2<-0
	while(k<(length(t1)+length(t2)))
	{
		if((ind1<=(length(t1)))&&(ind2<=(length(t2))))
		{
			if((as.numeric(names(t1)[ind1]))<(as.numeric(names(t2)[ind2])))
			{
				cdf1<-cdf1+t1[ind1]
				ind1<-ind1+1
				vec[k]<-abs(cdf1-cdf2)
				k<-k+1
			}else
			{
				if((as.numeric(names(t1)[ind1]))==(as.numeric(names(t2)[ind2])))
				{
					cdf1<-cdf1+t1[ind1]
			        ind1<-ind1+1
			        cdf2<-cdf2+t2[ind2]
			        ind2<-ind2+1
			        vec[k]<-abs(cdf1-cdf2)
			        vec[k+1]<-abs(cdf1-cdf2)
			        k<-k+2
				}else
				{
			    	cdf2<-cdf2+t2[ind2]
				    ind2<-ind2+1
				    vec[k]<-abs(cdf1-cdf2)
				    k<-k+1
				}
			}
		}else
		{
			if(ind1<=(length(t1)))
			{
				cdf1<-cdf1+t1[ind1]
				ind1<-ind1+1
				vec[k]<-abs(cdf1-cdf2)
				k<-k+1
			}else
			{
				cdf2<-cdf2+t2[ind2]
				ind2<-ind2+1
				vec[k]<-abs(cdf1-cdf2)
				k<-k+1
			}
		}
	}
	if(length(x1)==0)
	{
		if(length(x2)==0)
		{
			return(0)
		}else
		{
			return(1)
		}
	}else if(length(x2)==0)
	{
		return(1)
	}else
	{
	return(max(vec))
	}
}



